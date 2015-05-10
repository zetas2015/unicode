import re

USED_NAMES = set()
AMBIGUOUS_NAMES = set()
UNICODE_DATA_FILE = "unicode_data.txt"
NAME_ALIAS_FILE = "name_aliases.txt"

def register_name(name):
    if name in USED_NAMES:
        AMBIGUOUS_NAMES.add(name)
    else:
        USED_NAMES.add(name)


def is_not_ambiguous(name):
    return name not in AMBIGUOUS_NAMES


class Unicode(object):

    CODEPOINT_PATTERN = re.compile("^0x[0-9A-F]+$")
    NAME_TYPES = ['name', 'correction', 'control', 'alternate', 'figment', 'abbreviation']

    def __init__(self, codepoint, name, majorCategory, category):
        self._names = dict()
        self.codepoint = codepoint
        self.name = name
        self.majorCategory = majorCategory
        self.category = category

    @property
    def codepoint(self):
        return self._codepoint

    @codepoint.setter
    def codepoint(self, codepoint):
        if (isinstance(codepoint, str) and
                Unicode.CODEPOINT_PATTERN.match(codepoint)):
            self._codepoint = codepoint
        else:
            raise ValueError("Codepoint %s has wrong format" % str(codepoint))

    @property
    def name(self):
        all_names = self.allNames
        if len(all_names) == 0:
            raise ValueError("No name was found for codepoint %s" % self.codepoint)
        return all_names[0]

    @property
    def allNames(self):
        names = []
        for n_type in Unicode.NAME_TYPES:
            for name in self._names.get(n_type, []):
                if is_not_ambiguous(name):
                    names.append(name)
        return names

    @name.setter
    def name(self, name):
        if not isinstance(name, str) or len(name) == 0:
            raise ValueError("Name should be a non-empty string")
        register_name(name)
        self._names["name"] = [name]

    @property
    def majorCategory(self):
        return self._majorCategory

    @majorCategory.setter
    def majorCategory(self, mc):
        if not isinstance(mc, str) or len(mc) != 1:
            raise ValueError("Major category shoud be a single character string")
        self._majorCategory = mc

    @property
    def category(self):
        return self._category

    @category.setter
    def category(self, c):
        if not isinstance(c, str) or len(c) != 2:
            raise ValueError("Category should be a 2-character string")
        self._category = c

    def add_alias(self, alias_name, alias_type):
        register_name(alias_name)
        if alias_type not in self._names:
            self._names[alias_type] = []
        self._names[alias_type].append(alias_name)

    def __str__(self):
        return "%s; %s; %s; %s\n    NAMES: %s" % (self.codepoint, self.name, self.majorCategory, self.category, str(self._names))



# reads data from UNICODE_DATA_FILE
# return a dictionry whose key is codepoint and value is the corresponding Unicode object
# for each row, we only take the first three columns, which are codepoint, name and general category
def load_unicode_data():
    unicodes = {}
    with open(UNICODE_DATA_FILE) as fp:
        for row in fp.readlines():
            #print "Processing data %s" % row
            row = row.split(';')
            cp = "0x" + row[0].strip() # codepoint
            gc = row[2].strip() # general category
            mc = gc[0] # major category
            if cp in unicodes:
                print "WARNING: codepoint %s has already been added" % cp
                continue
            unicodes[cp] = Unicode(cp, row[1].strip(), mc, gc)
    return unicodes


def read_alias():
    aliases = []
    with open(NAME_ALIAS_FILE) as fp:
        for row in fp.readlines():
            row = row.strip('\n').strip()
            if len(row) == 0:
                continue
            if row[0] == '#':
                continue
            try:
                cp, an, at = row.split(';', 2)
                aliases.append(('0x' + cp.strip(), an.strip(), at.strip()))
            except Exception, e:
                print "ERROR while processing alias %s" % row
                continue
    return aliases


def add_alias(unicodes):
    for alias in read_alias():
        #print "Processing alias %s" % str(alias)
        unicodes[alias[0]].add_alias(alias[1], alias[2])


def get_unicode_records():
    unicodes = load_unicode_data()
    add_alias(unicodes)
    return unicodes.values()[:500] # only return 500 records for testing


def generate_grace_source():
    unicode_records = get_unicode_records()
    with open('my_unicodes.grace', 'w') as out:
        _write_ambiguous_names(out)
        _write_unicode_struct_constants(out)
        _write_unicode_records(out, unicode_records)
        _write_unicode_name_lookup(out, unicode_records)
        _write_alias_map(out, unicode_records)


def _write_ambiguous_names(fp):
    fp.write('def AMBIGUOUS_NAMES = set.with(')
    ab_names = list(AMBIGUOUS_NAMES)
    for i in range(len(ab_names)):
        fp.write('"%s"' % ab_names[i])
        if i < len(ab_names) - 1:
            fp.write(', ')
    fp.write(')\n\n')


def _write_unicode_struct_constants(fp):
    fp.write('def CODEPOINT_POS = 1\n')
    fp.write('def NAME_POS = 2\n')
    fp.write('def MAJOR_CATEGORY_POS = 3\n')
    fp.write('def CATEGORY_POS = 4\n\n')


def _write_unicode_records(fp, records):
    fp.write('def Unicode_Records = [\n')
    records.sort(key=_codepoint_value)
    line_fmt = '  [%s, "%s", "%s", "%s"]'
    for i in range(len(records)):
        r = records[i]
        fp.write(line_fmt % (r.codepoint, r.name, r.majorCategory, r.category))
        if i < len(records) - 1:
            fp.write(',')
        fp.write('\n')
    fp.write('  ]\n\n')
    

def _write_unicode_name_lookup(fp, records):
    records.sort(key=_codepoint_value)
    ix_name_pairs = []
    for ix, r in enumerate(records):
        ix_name_pairs.append((ix + 1, r.name)) # grace index is 1-based
    ix_name_pairs.sort(key=lambda p: p[1])
    fp.write('def Unicode_Name_Lookup = [\n  ')
    for i, pr in enumerate(ix_name_pairs):
        fp.write(' %s' % pr[0])
        if i < len(ix_name_pairs) - 1:
            fp.write(',')
        if (i + 1) % 10 == 0:
            fp.write('\n  ')
    fp.write(']\n\n')


def _codepoint_value(ur):
    return int(ur.codepoint, 16)


def _write_alias_map(fp, records):
    fp.write('def Alias_Codepoint_Map = dictionary.with(')
    started = False
    for rec in records:
        name = rec.name
        for al in rec.allNames:
            if al != name:
                if started:
                    fp.write(',')
                fp.write('\n  "%s"::%s' % (al, rec.codepoint))
                started = True
    fp.write('\n)\n\n')



def test_load_unicode_data(verbose=True):
    unicodes = load_unicode_data()
    add_alias(unicodes)
    print len(unicodes)
    if verbose:
        for k, v in unicodes.items():
            print v


if __name__ == "__main__":
    generate_grace_source()
    #test_load_unicode_data()

