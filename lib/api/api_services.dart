import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/api/api_consts.dart';
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
}
