import 'package:punycode_converter/punycode_converter.dart';

void main() {
  final uri = Uri.parse('http://тетрадкадружбы.рф/страница');
  print(uri.punyEncoded);
  print(uri.punyEncoded.punyDecoded);
  print(uri.punyEncoded.punyEncoded);

  final uri2 = Uri.parse('http://example.com/some-page');
  print(uri2.punyEncoded);
  print(uri2.punyEncoded.punyDecoded);
  print(uri2.punyEncoded.punyEncoded);

  print(Punycode.domainEncode('bücher.com'));
}
