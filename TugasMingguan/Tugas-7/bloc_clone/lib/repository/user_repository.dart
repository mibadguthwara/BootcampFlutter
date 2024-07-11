import 'dart:convert';

import 'package:http/http.dart' as http;
import '/model/user.dart';

class UserRepository {
  final Map<String, String> _headers = {
    "Content-Type": "application/json",
  };

  Future<User> getById(int id) async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/users/$id');

    final http.Response response = await http.get(url, headers: _headers);
    final Map<String, dynamic> body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return User.fromJson(body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
