import 'package:flutter/material.dart';
import 'package:newsapp/api/api_services.dart';
import 'package:newsapp/screens/categories/models/news_model/article.dart';
import 'package:newsapp/screens/categories/models/news_model/news_model.dart';

class NewsProvider with ChangeNotifier {
  bool waiting = false;
  bool searching = false;
  List<Article>? news = [];
  String? errorMessage;
  Future getNews(String sourceId, int pageNo) async {
    waiting = true;
    notifyListeners();
    try {
      NewsModel newsModel = await ApiServices.getNews(sourceId, pageNo);
      List<Article> newArticles = newsModel.articles??[];
      if (pageNo == 1) {
        news = newArticles;
      } else {
        news?.addAll(newArticles);
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    waiting = false;
    notifyListeners();
  }

  Future searchNews(String categoryId, String searchText) async {
    waiting = true;
    searching = true;
    notifyListeners();
    List<Article>? searchedForArticles =
        await ApiServices.searchNews(categoryId, searchText);
    try {
      news = searchedForArticles;
    } catch (e) {
      errorMessage = e.toString();
    }
    waiting = false;
    searching = false;
    notifyListeners();
  }
}
