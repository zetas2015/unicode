from unicodegen import get_unicode_records
import random

TEST_FILE = "unicodesTests.grace"
TEST_CLASS = "unicodesTest"
TEST_OBJ = "unicodesTests"
TEST_SZ = 20

def write_tests():
    records = get_unicode_records()
    with open(TEST_FILE, 'w') as out:
        _write_head(out)
        _write_name_tests(out, records)
        _write_character_tests(out, records)
        _write_mc_tests(out, records)
        _write_gc_tests(out, records)
        _write_exception_tests(out)
        _write_tail(out)


def _write_head(fp):
    head = 'import "gUnit" as gU\n'\
           'import "unicodes" as unicodes\n\n'\
           'def uc = unicodes.unicode\n\n'\
           'def %s = object {\n'\
           '  class forMethod(m) {\n'\
           '    inherits gU.testCaseNamed(m)\n\n'
    fp.write(head % TEST_CLASS)


def _write_exception_tests(fp):
    test_fmt = '    method test%s {\n'\
               '      assert {%s} shouldRaise (unicodes.%s)\n    }\n\n'
    nsc = 'NoSuchCharacter'
    an = 'AmbiguousName'
    fp.write(test_fmt % (nsc + '1', 'uc.name(0xFFFFFF)', nsc))
    fp.write(test_fmt % (nsc + '2', 'uc.character("I AM NOT A UNICODE")', nsc))
    fp.write(test_fmt % (an, 'uc.character("<control>")', an))


def _write_tail(fp):
    tail = '  }\n}\n\n\n'\
           'def %s = gU.testSuite.fromTestMethodsIn(%s)\n'\
           'print "testing"\n'\
           '%s.runAndPrintResults'
    fp.write(tail % (TEST_OBJ, TEST_CLASS, TEST_OBJ))


def _write_name_tests(fp, records):
    records = _get_random_records(records)
    name_test_fmt = '    method testName%s {\n'\
                    '      assert (uc.name(%s)) shouldBe "%s"\n    }\n\n'
    for r in records:
        fp.write(name_test_fmt % (r.codepoint, r.codepoint, r.name))


def _write_character_tests(fp, records):
    records = _get_random_records(records)
    char_test_fmt = '    method testCharacter%s {\n'\
                    '      assert (uc.character("%s")) shouldBe %s\n    }\n\n'
    for r in records:
        fp.write(char_test_fmt % (r.codepoint, r.name, r.codepoint))


def _write_mc_tests(fp, records):
    records = _get_random_records(records)
    mc_test_fmt = '    method testMC%s {\n'\
                  '      assert (uc.majorCategory(%s)) shouldBe "%s"\n    }\n\n'
    for r in records:
        fp.write(mc_test_fmt % (r.codepoint, r.codepoint, r.majorCategory))


def _write_gc_tests(fp, records):
    records = _get_random_records(records)
    gc_test_fmt = '    method testGC%s {\n'\
                  '      assert (uc.category(%s)) shouldBe "%s"\n    }\n\n'
    for r in records:
        fp.write(gc_test_fmt % (r.codepoint, r.codepoint, r.category))


# randomly take tot items from a list of records
def _get_random_records(records, tot=TEST_SZ):
    sz = len(records)
    if sz <= tot:
        return records
    selected = set()
    while True:
        ix = random.randint(0, sz - 1)
        selected.add(records[ix])
        if len(selected) == tot:
            break
    return list(selected)




if __name__ == "__main__":
    write_tests()
