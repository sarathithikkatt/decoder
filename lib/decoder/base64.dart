import 'dart:convert';

String decodeBase64String(String base64String) {
  print("DECODING SHIT");
  List<int> bytes = base64.decode(base64String);
  String decodedString = utf8.decode(bytes);
  return decodedString;
}
