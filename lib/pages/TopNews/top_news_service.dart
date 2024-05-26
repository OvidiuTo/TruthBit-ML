import "package:http/http.dart" as http;
import 'dart:convert';

import 'package:truth_bit/pages/TopNews/top_news_model.dart';

class TopNewsService {
  static Future<NewsResponse> getNews(String api) async {
    final response = await http.get(Uri.parse(api));
    Map<String, dynamic> parsedJson = json.decode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(parsedJson);

    return newsResponse;
  }
}
