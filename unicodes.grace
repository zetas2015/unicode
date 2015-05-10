import "my_unicodes" as mu

def NoSuchCharacter = Exception.refine "No such character"
def AmbiguousName = Exception.refine "Ambiguous name"

factory method unicode {
  
  method avg(a:Number, b:Number) is confidential {
    if ( ((a+b)%2) > 0 ) then {
      return (a+b-1) / 2
    } else { return (a+b) / 2 }
  }
  
  method search_by_codepoint(cp:Number) is confidential {
    var start := 1
    var end := mu.Unicode_Records.size
    
    while {start <= end} do {
      var mid := avg(start, end)
      var rec := mu.Unicode_Records[mid]
      if (rec[mu.CODEPOINT_POS] == cp) then {
        return rec
      } elseif (rec[mu.CODEPOINT_POS] < cp) then {
        start := mid + 1
      } else { end := mid - 1 }
    }
    
    NoSuchCharacter.raise "error"
  }
  
  method search_by_name(ns:String) is confidential {
    var start := 1
    var end := mu.Unicode_Name_Lookup.size
    
    while {start <= end} do {
      var mid := avg(start, end)
      var rec := mu.Unicode_Records[mu.Unicode_Name_Lookup[mid]]
      if (rec[mu.NAME_POS] == ns) then {
        return rec
      } elseif (rec[mu.NAME_POS] < ns) then {
        start := mid + 1
      } else { end := mid - 1 }
    }
    
    NoSuchCharacter.raise "error"
  }
  
  method name(cp:Number) {
    var ur := search_by_codepoint(cp)
    ur[mu.NAME_POS]
  }
  
  method majorCategory(cp:Number) {
    var ur := search_by_codepoint(cp)
    ur[mu.MAJOR_CATEGORY_POS]
  }
  
  method category(cp:Number) {
    var ur := search_by_codepoint(cp)
    ur[mu.CATEGORY_POS]
  }
  
  method character(ns:String) {
    if (mu.AMBIGUOUS_NAMES.contains(ns)) then {
      AmbiguousName.raise "error"
    } elseif (mu.Alias_Codepoint_Map.containsKey(ns)) then {
      return mu.Alias_Codepoint_Map[ns]
    } else {
      var ur := search_by_name(ns)
      ur[mu.CODEPOINT_POS]
    }
  }
  
}

