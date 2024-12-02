import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:newsapp/api/api_consts.dart';
import 'package:newsapp/screens/categories/models/news_model/article.dart';
import 'package:newsapp/screens/categories/models/news_model/news_model.dart';
import 'package:newsapp/screens/categories/models/sources_model.dart';

class ApiServices {
  static Future<Sources> getSources(String categoryId) async {
    var url = Uri.https(ApiConsts.baseURL, ApiConsts.sourcesEndpoint,
        {"apiKey": ApiConsts.apiKey, "category": categoryId});
    var response = await http.get(url);
    String body = response.body;
    var bodyJson = jsonDecode(body);
    return Sources.fromJson(bodyJson);
  }

  static Future<NewsModel> getNews(String sourceId, int pageNo) async {
    var url = Uri.https(ApiConsts.baseURL, ApiConsts.newsEndpoint, {
      "apiKey": ApiConsts.apiKey,
      "sources": sourceId,
      "page": "$pageNo",
      "pageSize": "10"
    });
    var response = await http.get(url);
    String body = response.body;
    var bodyJson = jsonDecode(body);
    return NewsModel.fromJson(bodyJson);
  }

  static Future<List<Article>> searchNews(
      String categoryId, String searchQuery) async {
    var url = Uri.https(ApiConsts.baseURL, ApiConsts.newsEndpoint,
        {"apiKey": ApiConsts.apiKey, 'q': searchQuery});

    var response = await http.get(url);
    String body = response.body;
    var bodyJson = jsonDecode(body);
    var newsReturned = NewsModel.fromJson(bodyJson);
    return newsReturned.articles ?? [];
  }
}
