import "gUnit" as gU
import "unicode" as unicode

def uc = unicode.unicode

def unicodesTest = object {
  class forMethod(m) {
    inherits gU.testCaseNamed(m)

    method testName0x0C40 {
      assert (uc.name(0x0C40)) shouldBe "TELUGU VOWEL SIGN II"
    }

    method testName0x1296 {
      assert (uc.name(0x1296)) shouldBe "ETHIOPIC SYLLABLE NO"
    }

    method testName0x1298 {
      assert (uc.name(0x1298)) shouldBe "ETHIOPIC SYLLABLE NYA"
    }

    method testName0xA117 {
      assert (uc.name(0xA117)) shouldBe "YI SYLLABLE DUP"
    }

    method testName0x13358 {
      assert (uc.name(0x13358)) shouldBe "EGYPTIAN HIEROGLYPH U033"
    }

    method testName0x30D9 {
      assert (uc.name(0x30D9)) shouldBe "KATAKANA LETTER BE"
    }

    method testName0xA328 {
      assert (uc.name(0xA328)) shouldBe "YI SYLLABLE SYRX"
    }

    method testName0x2F95 {
      assert (uc.name(0x2F95)) shouldBe "KANGXI RADICAL VALLEY"
    }

    method testName0x1F6BD {
      assert (uc.name(0x1F6BD)) shouldBe "TOILET"
    }

    method testName0x16A1D {
      assert (uc.name(0x16A1D)) shouldBe "BAMUM LETTER PHASE-F YA"
    }

    method testName0xA119 {
      assert (uc.name(0xA119)) shouldBe "YI SYLLABLE DUR"
    }

    method testName0x11369 {
      assert (uc.name(0x11369)) shouldBe "COMBINING GRANTHA DIGIT THREE"
    }

    method testName0x0C46 {
      assert (uc.name(0x0C46)) shouldBe "TELUGU VOWEL SIGN E"
    }

    method testName0xE01DF {
      assert (uc.name(0xE01DF)) shouldBe "VARIATION SELECTOR-240"
    }

    method testName0x11681 {
      assert (uc.name(0x11681)) shouldBe "TAKRI LETTER AA"
    }

    method testName0x11682 {
      assert (uc.name(0x11682)) shouldBe "TAKRI LETTER I"
    }

    method testName0x1382 {
      assert (uc.name(0x1382)) shouldBe "ETHIOPIC SYLLABLE MWEE"
    }

    method testName0xFF83 {
      assert (uc.name(0xFF83)) shouldBe "HALFWIDTH KATAKANA LETTER TE"
    }

    method testName0x11061 {
      assert (uc.name(0x11061)) shouldBe "BRAHMI NUMBER SEVENTY"
    }

    method testName0x12082 {
      assert (uc.name(0x12082)) shouldBe "CUNEIFORM SIGN DUGUD"
    }

    method testCharacter0x2041 {
      assert (uc.character("CARET INSERTION POINT")) shouldBe 0x2041
    }

    method testCharacter0x12082 {
      assert (uc.character("CUNEIFORM SIGN DUGUD")) shouldBe 0x12082
    }

    method testCharacter0x2047 {
      assert (uc.character("DOUBLE QUESTION MARK")) shouldBe 0x2047
    }

    method testCharacter0x0376 {
      assert (uc.character("GREEK CAPITAL LETTER PAMPHYLIAN DIGAMMA")) shouldBe 0x0376
    }

    method testCharacter0xA115 {
      assert (uc.character("YI SYLLABLE DUX")) shouldBe 0xA115
    }

    method testCharacter0x1534 {
      assert (uc.character("CANADIAN SYLLABICS WEST-CREE YWII")) shouldBe 0x1534
    }

    method testCharacter0xFE79 {
      assert (uc.character("ARABIC DAMMA MEDIAL FORM")) shouldBe 0xFE79
    }

    method testCharacter0x1A60 {
      assert (uc.character("TAI THAM SIGN SAKOT")) shouldBe 0x1A60
    }

    method testCharacter0xA325 {
      assert (uc.character("YI SYLLABLE SYX")) shouldBe 0xA325
    }

    method testCharacter0x13E4 {
      assert (uc.character("CHEROKEE LETTER TSE")) shouldBe 0x13E4
    }

    method testCharacter0x13358 {
      assert (uc.character("EGYPTIAN HIEROGLYPH U033")) shouldBe 0x13358
    }

    method testCharacter0x153B {
      assert (uc.character("CANADIAN SYLLABICS YWAA")) shouldBe 0x153B
    }

    method testCharacter0x1A66 {
      assert (uc.character("TAI THAM VOWEL SIGN II")) shouldBe 0x1A66
    }

    method testCharacter0x2F92B {
      assert (uc.character("CJK COMPATIBILITY IDEOGRAPH-2F92B")) shouldBe 0x2F92B
    }

    method testCharacter0x1F6B1 {
      assert (uc.character("NON-POTABLE WATER SYMBOL")) shouldBe 0x1F6B1
    }

    method testCharacter0x1168B {
      assert (uc.character("TAKRI LETTER KHA")) shouldBe 0x1168B
    }

    method testCharacter0x2F927 {
      assert (uc.character("CJK COMPATIBILITY IDEOGRAPH-2F927")) shouldBe 0x2F927
    }

    method testCharacter0x16A1E {
      assert (uc.character("BAMUM LETTER PHASE-F NSHA")) shouldBe 0x16A1E
    }

    method testCharacter0xA650 {
      assert (uc.character("CYRILLIC CAPITAL LETTER YERU WITH BACK YER")) shouldBe 0xA650
    }

    method testCharacter0xA0B1 {
      assert (uc.character("YI SYLLABLE MIP")) shouldBe 0xA0B1
    }

    method testMC0x0F93 {
      assert (uc.majorCategory(0x0F93)) shouldBe "M"
    }

    method testMC0x13E3 {
      assert (uc.majorCategory(0x13E3)) shouldBe "L"
    }

    method testMC0x1F773 {
      assert (uc.majorCategory(0x1F773)) shouldBe "S"
    }

    method testMC0x12082 {
      assert (uc.majorCategory(0x12082)) shouldBe "L"
    }

    method testMC0x1535 {
      assert (uc.majorCategory(0x1535)) shouldBe "L"
    }

    method testMC0x11068 {
      assert (uc.majorCategory(0x11068)) shouldBe "N"
    }

    method testMC0x037C {
      assert (uc.majorCategory(0x037C)) shouldBe "L"
    }

    method testMC0x129C {
      assert (uc.majorCategory(0x129C)) shouldBe "L"
    }

    method testMC0x2F98 {
      assert (uc.majorCategory(0x2F98)) shouldBe "S"
    }

    method testMC0x0377 {
      assert (uc.majorCategory(0x0377)) shouldBe "L"
    }

    method testMC0x1208B {
      assert (uc.majorCategory(0x1208B)) shouldBe "L"
    }

    method testMC0xE01D3 {
      assert (uc.majorCategory(0xE01D3)) shouldBe "M"
    }

    method testMC0x11060 {
      assert (uc.majorCategory(0x11060)) shouldBe "N"
    }

    method testMC0x13ED {
      assert (uc.majorCategory(0x13ED)) shouldBe "L"
    }

    method testMC0xA0BC {
      assert (uc.majorCategory(0xA0BC)) shouldBe "L"
    }

    method testMC0xFE74 {
      assert (uc.majorCategory(0xFE74)) shouldBe "L"
    }

    method testMC0x1106F {
      assert (uc.majorCategory(0x1106F)) shouldBe "N"
    }

    method testMC0xA32D {
      assert (uc.majorCategory(0xA32D)) shouldBe "L"
    }

    method testMC0x00C9 {
      assert (uc.majorCategory(0x00C9)) shouldBe "L"
    }

    method testMC0x2F9D {
      assert (uc.majorCategory(0x2F9D)) shouldBe "S"
    }

    method testGC0x0C4C {
      assert (uc.category(0x0C4C)) shouldBe "Mn"
    }

    method testGC0x2FD5 {
      assert (uc.category(0x2FD5)) shouldBe "So"
    }

    method testGC0x13E9 {
      assert (uc.category(0x13E9)) shouldBe "Lo"
    }

    method testGC0x1D6DB {
      assert (uc.category(0x1D6DB)) shouldBe "Sm"
    }

    method testGC0x1E8B6 {
      assert (uc.category(0x1E8B6)) shouldBe "Lo"
    }

    method testGC0x118CB {
      assert (uc.category(0x118CB)) shouldBe "Ll"
    }

    method testGC0x1168A {
      assert (uc.category(0x1168A)) shouldBe "Lo"
    }

    method testGC0x11680 {
      assert (uc.category(0x11680)) shouldBe "Lo"
    }

    method testGC0xA11C {
      assert (uc.category(0xA11C)) shouldBe "Lo"
    }

    method testGC0x30D2 {
      assert (uc.category(0x30D2)) shouldBe "Lo"
    }

    method testGC0x17DA {
      assert (uc.category(0x17DA)) shouldBe "Po"
    }

    method testGC0xF96D {
      assert (uc.category(0xF96D)) shouldBe "Lo"
    }

    method testGC0x1D689 {
      assert (uc.category(0x1D689)) shouldBe "Lu"
    }

    method testGC0x11683 {
      assert (uc.category(0x11683)) shouldBe "Lo"
    }

    method testGC0x33CB {
      assert (uc.category(0x33CB)) shouldBe "So"
    }

    method testGC0x1E8B4 {
      assert (uc.category(0x1E8B4)) shouldBe "Lo"
    }

    method testGC0x2F98 {
      assert (uc.category(0x2F98)) shouldBe "So"
    }

    method testGC0x30D6 {
      assert (uc.category(0x30D6)) shouldBe "Lo"
    }

    method testGC0x11061 {
      assert (uc.category(0x11061)) shouldBe "No"
    }

    method testGC0x1F6BF {
      assert (uc.category(0x1F6BF)) shouldBe "So"
    }

    method testNoSuchCharacter1 {
      try {
        uc.name(0xFFFFFF)
      } catch {
        e : unicodes.NoSuchCharacter -> print "Ok; caught NoSuchCharacter exception"
      }
    }

    method testNoSuchCharacter2 {
      try {
        uc.character("I AM NOT A UNICODE")
      } catch {
        e : unicodes.NoSuchCharacter -> print "Ok; caught NoSuchCharacter exception"
      }
    }

    method testAmbiguousName {
      try {
        uc.character("<control>")
      } catch {
        e : unicodes.AmbiguousName -> print "Ok; caught AmbiguousName exception"
      }
    }

  }
}


def unicodesTests = gU.testSuite.fromTestMethodsIn(unicodesTest)
print "testing"
unicodesTests.runAndPrintResults
