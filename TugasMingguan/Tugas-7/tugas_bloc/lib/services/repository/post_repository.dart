import 'dart:convert';
import 'package:http/http.dart';
import '/services/model/post_model.dart';

class PostRepository {
  String postUrl = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<PostModel>> getPosts() async {
    Response response = await get(Uri.parse(postUrl));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
