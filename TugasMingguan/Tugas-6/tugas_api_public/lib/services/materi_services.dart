import 'dart:convert';
import '../model/comment_model.dart';
import '../model/list_comment_model.dart';
import 'package:http/http.dart' as http;

class MateriServices {
  static Future<Comment> fetchcomment(id) async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/comments/$id"));

    if (response.statusCode == 200) {
      return Comment.fromJson(
          jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception("Failed gagal konek ke to load comment");
    }
  }

  static Future<List<Post>> getPosts() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/comments");
    final response =
        await http.get(url, headers: {"Content-Type": "application/json"});

    final List body = json.decode(response.body);

    return body.map((e) => Post.fromJson(e)).toList();
  }
}
