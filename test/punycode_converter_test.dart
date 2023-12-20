import 'package:test/test.dart';
import 'package:punycode_converter/punycode_converter.dart';

import 'test_cases.dart';

void main() {
  group('Encode strings', () {
    for (final testCase in testStrings) {
      test(testCase.name, () {
        expect(Punycode.encode(testCase.decoded), testCase.encoded);
      });
    }
  });

  group('Decode strings', () {
    for (final testCase in testStrings) {
      test(testCase.name, () {
        expect(Punycode.decode(testCase.encoded), testCase.decoded);
      });
    }
  });

  group('Encode domains', () {
    for (final testCase in testDomains) {
      test(testCase.name, () {
        expect(Punycode.domainEncode(testCase.decoded), testCase.encoded);
      });
    }
  });

  group('Decode domains', () {
    for (final testCase in testDomains) {
      test(testCase.name, () {
        expect(Punycode.domainDecode(testCase.encoded), testCase.decoded);
      });
    }
  });

  group('Encode separators', () {
    for (final testCase in testSeparators) {
      test(testCase.name, () {
        expect(Punycode.domainEncode(testCase.decoded), testCase.encoded);
      });
    }
  });

  group('Encode uri', () {
    for (final testCase in testUris) {
      test(testCase.name, () {
        expect(testCase.decoded.punyEncoded, testCase.encoded);
      });
    }
  });

  group('Decode uri', () {
    for (final testCase in testUris) {
      test(testCase.name, () {
        expect(testCase.encoded.punyDecoded, testCase.decoded);
      });
    }
  });

  group('RFC 1054', () {
    final testCase = TestCase(
      decoded:
          "абвгдеёжзийклмнопрстуфхцчшщъыьэюяабвгдеёжзийклмнопрстуфхцчшщъыьэюя.рф",
      encoded:
          "xn--80aacbdcedfegfhgihjikjlkmlnmonpoqprqsrtsutvuwvxwyxzy0az1a0a2a1a3a2a4a3a5a4a6a5a6e6a.xn--p1ai",
    );

    final matcher = isA<PunycodeException>().having(
      (e) => e.message,
      'message',
      startsWith('A domain label must be not longer than 63 octets.'),
    );

    test('Check domain length when encoding', () {
      expect(
        () => Punycode.domainEncode(testCase.decoded),
        throwsA(matcher),
      );
    });

    test('Check domain length when decoding', () {
      expect(
        () => Punycode.domainDecode(testCase.encoded),
        throwsA(matcher),
      );
    });
  });
}
