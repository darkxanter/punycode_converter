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
}
