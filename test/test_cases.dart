// spell-checker: disable

class TestCase {
  final String? desc;
  final String encoded;
  final String decoded;

  String get name => desc ?? decoded;

  const TestCase({
    required this.encoded,
    required this.decoded,
    this.desc,
  });
}

final testStrings = [
  TestCase(
    encoded: "maana-pta",
    decoded: "mañana",
  ),
  TestCase(
    desc: "empty strings",
    encoded: "",
    decoded: "",
  ),
  TestCase(
    desc: "a single basic code point",
    encoded: "Bach-",
    decoded: "Bach",
  ),
  TestCase(
    desc: "a single non-ASCII character",
    encoded: "tda",
    decoded: "ü",
  ),
  TestCase(
    desc: "multiple non-ASCII characters",
    encoded: "4can8av2009b",
    decoded: "üëäö♥",
  ),
  TestCase(
    desc: "mix of ASCII and non-ASCII characters",
    encoded: "bcher-kva",
    decoded: "bücher",
  ),
  TestCase(
    desc: "long string with both ASCII and non-ASCII characters",
    encoded:
        "Willst du die Blthe des frhen, die Frchte des spteren Jahres-x9e96lkal",
    decoded: "Willst du die Blüthe des frühen, die Früchte des späteren Jahres",
  ),
  TestCase(
    desc: "Arabic (Egyptian)",
    encoded: "egbpdaj6bu4bxfgehfvwxn",
    decoded: "ليهمابتكلموشعربي؟",
  ),
  TestCase(
    desc: "Chinese (simplified)",
    encoded: "ihqwcrb4cv8a8dqg056pqjye",
    decoded: "他们为什么不说中文",
  ),
  TestCase(
    desc: "Chinese (traditional)",
    encoded: "ihqwctvzc91f659drss3x8bo0yb",
    decoded: "他們爲什麽不說中文",
  ),
  TestCase(
    desc: "Czech",
    encoded: "Proprostnemluvesky-uyb24dma41a",
    decoded: "Pročprostěnemluvíčesky",
  ),
  TestCase(
    desc: "Hebrew",
    encoded: "4dbcagdahymbxekheh6e0a7fei0b",
    decoded: "למההםפשוטלאמדבריםעברית",
  ),
  TestCase(
    desc: "Hindi (Devanagari)",
    encoded: "i1baa7eci9glrd9b2ae1bj0hfcgg6iyaf8o0a1dig0cd",
    decoded: "यहलोगहिन्दीक्योंनहींबोलसकतेहैं",
  ),
  TestCase(
    desc: "Japanese (kanji and hiragana)",
    encoded: "n8jok5ay5dzabd5bym9f0cm5685rrjetr6pdxa",
    decoded: "なぜみんな日本語を話してくれないのか",
  ),
  TestCase(
    desc: "Korean (Hangul syllables)",
    encoded:
        "989aomsvi5e83db1d2a355cv1e0vak1dwrv93d5xbh15a0dt30a5jpsd879ccm6fea98c",
    decoded: "세계의모든사람들이한국어를이해한다면얼마나좋을까",
  ),
  TestCase(
    desc: "Russian (Cyrillic)",
    encoded: "b1abfaaepdrnnbgefbadotcwatmq2g4l",
    decoded: "почемужеонинеговорятпорусски",
  ),
  TestCase(
    desc: "Spanish",
    encoded: "PorqunopuedensimplementehablarenEspaol-fmd56a",
    decoded: "PorquénopuedensimplementehablarenEspañol",
  ),
  TestCase(
    desc: "Vietnamese",
    encoded: "TisaohkhngthchnitingVit-kjcr8268qyxafd2f1b9g",
    decoded: "TạisaohọkhôngthểchỉnóitiếngViệt",
  ),
  TestCase(
    encoded: "3B-ww4c5e180e575a65lsy2b",
    decoded: "3年B組金八先生",
  ),
  TestCase(
    encoded: "-with-SUPER-MONKEYS-pc58ag80a8qai00g7n9n",
    decoded: "安室奈美恵-with-SUPER-MONKEYS",
  ),
  TestCase(
    encoded: "Hello-Another-Way--fc4qua05auwb3674vfr0b",
    decoded: "Hello-Another-Way-それぞれの場所",
  ),
  TestCase(
    encoded: "2-u9tlzr9756bt3uc0v",
    decoded: "ひとつ屋根の下2",
  ),
  TestCase(
    encoded: "MajiKoi5-783gue6qz075azm5e",
    decoded: "MajiでKoiする5秒前",
  ),
  TestCase(
    encoded: "de-jg4avhby1noc0d",
    decoded: "パフィーdeルンバ",
  ),
  TestCase(
    encoded: "d9juau41awczczp",
    decoded: "そのスピードで",
  ),
  TestCase(
    desc: "ASCII string that breaks the existing rules for host-name labels",
    encoded: "-> \$1.00 <--",
    decoded: "-> \$1.00 <-",
  ),
];

final testDomains = [
  TestCase(
    decoded: "mañana.com",
    encoded: "xn--maana-pta.com",
  ),
  TestCase(
    decoded: "example.com",
    encoded: "example.com",
  ),
  TestCase(
    decoded: "example.com.",
    encoded: "example.com.",
  ),
  TestCase(
    decoded: "bücher.com",
    encoded: "xn--bcher-kva.com",
  ),
  TestCase(
    decoded: "café.com",
    encoded: "xn--caf-dma.com",
  ),
  TestCase(
    decoded: "☃-⌘.com",
    encoded: "xn----dqo34k.com",
  ),
  TestCase(
    decoded: "퐀☃-⌘.com",
    encoded: "xn----dqo34kn65z.com",
  ),
  TestCase(
    decoded: "тетрадкадружбы.рф",
    encoded: "xn--80aadkbcl3a5cfobu8i.xn--p1ai",
  ),
  TestCase(
    desc: "Emoji",
    decoded: "💩.la",
    encoded: "xn--ls8h.la",
  ),
  // TestCase(
  //   desc: "Non-printable ASCII",
  //   decoded: "\x00\x01\x02foo.bar",
  //   encoded: "\x00\x01\x02foo.bar",
  // ),
];

final testSeparators = [
  TestCase(
    desc: "Using U+002E as separator",
    decoded: "mañana.com",
    encoded: "xn--maana-pta.com",
  ),
  TestCase(
    desc: "Using U+3002 as separator",
    decoded: "mañana\u3002com",
    encoded: "xn--maana-pta.com",
  ),
  TestCase(
    desc: "Using U+FF0E as separator",
    decoded: "mañana\uFF0Ecom",
    encoded: "xn--maana-pta.com",
  ),
  TestCase(
    desc: "Using U+FF61 as separator",
    decoded: "mañana\uFF61com",
    encoded: "xn--maana-pta.com",
  ),
];

class UriTestCase {
  final Uri encoded;
  final Uri decoded;

  String get name => Uri.decodeComponent(decoded.host);

  const UriTestCase({
    required this.encoded,
    required this.decoded,
  });
}

final testUris = [
  UriTestCase(
    decoded: Uri.parse('http://тетрадкадружбы.рф/страница'),
    encoded: Uri.parse('http://xn--80aadkbcl3a5cfobu8i.xn--p1ai/страница'),
  ),
  UriTestCase(
    decoded: Uri.parse('http://example.com/some-page'),
    encoded: Uri.parse('http://example.com/some-page'),
  ),
];

final malformedTestCases = [
  TestCase(encoded: 'foo_bar.com', decoded: 'foo_bar.com'),
  TestCase(encoded: 'foo%bar.com', decoded: 'foo%bar.com'),
  TestCase(encoded: 'foobar-.com', decoded: 'foobar-.com'),
  TestCase(encoded: '1foobar.com', decoded: '1foobar.com'),
  TestCase(encoded: '1.com', decoded: "1.com"),
  TestCase(encoded: 'foo bar.com', decoded: 'foo bar.com'),
  TestCase(encoded: 'xn--_-9sbaja.xn--21aa', decoded: 'бб_гг.ээ'),
  TestCase(encoded: '.', decoded: '.'),
];
