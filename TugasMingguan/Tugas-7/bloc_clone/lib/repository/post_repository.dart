import 'dart:convert';
import 'package:http/http.dart' as http;
import '/model/post.dart';

class PostRepository {
  final Map<String, String> _headers = {
    "Content-Type": "application/json",
  };

  Future<List<Post>> getAll() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');

    final http.Response response = await http.get(url, headers: _headers);
    final List<dynamic> body = jsonDecode(response.body);

    if (response.statusCode == 200) {
      return body.map((e) => Post.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
