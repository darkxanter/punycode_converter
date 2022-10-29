# Punycode converter

![MIT License](https://img.shields.io/badge/License-MIT-green)
[![pub version](https://img.shields.io/pub/v/punycode_converter.svg?label=pub&color=orange)](https://pub.dev/packages/punycode_converter)

punycode_converter provides methods for converting IDN (international domain names)

### Usage


```dart
import 'package:punycode_converter/punycode_converter.dart';

void main() {
  final uri = Uri.parse('http://тетрадкадружбы.рф/страница');
  print(uri.punyEncoded);
  print(Punycode.domainEncode('bücher.com'));
}

```
