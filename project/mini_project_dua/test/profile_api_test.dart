import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

void main() {
  test("Fetch users from API", () async {
    final response =
        await http.get(Uri.parse('https://fakestoreapi.com/users'));

    expect(response.statusCode, 200);

    final jsonResponse = jsonDecode(response.body);
    expect(jsonResponse, isList);

    if (jsonResponse.isNotEmpty) {
      expect(jsonResponse[0]['id'], isNotNull);
      expect(jsonResponse[0]['email'], isNotNull);
      expect(jsonResponse[0]['username'], isNotNull);
      expect(jsonResponse[0]['password'], isNotNull);
      expect(jsonResponse[0]['name'], isNotNull);
      expect(jsonResponse[0]['phone'], isNotNull);
      expect(jsonResponse[0]['address'], isNotNull);
    }
  });
}
