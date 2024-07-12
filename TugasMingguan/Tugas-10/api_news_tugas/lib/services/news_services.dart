import 'dart:convert';
import 'package:http/http.dart';

import '../models/news_org_model.dart';

class NewsServices {
  Future<List<NewsOrgModel>> getNews() async {
    String baseUrl = "https://newsapi.org/v2/top-headlines";

    Map<String, String> queryParams = {
      'sources': 'techcrunch',
      'apiKey': 'f7bd548c5e874bb6bcfeea9a0fc30845',
    };

    String queryString = Uri(queryParameters: queryParams).query;

    String apiUrl = '$baseUrl?$queryString';

    Response response = await get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      print(result);
      return result.map((e) => NewsOrgModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
