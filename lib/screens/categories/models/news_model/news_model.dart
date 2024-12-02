

import 'article.dart';


class NewsModel {
  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  const NewsModel({this.status, this.totalResults, this.articles});

  @override
  String toString() {
    return 'NewsModel(status: $status, totalResults: $totalResults, articles: $articles)';
  }

  factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
        status: json['status'] as String?,
        totalResults: json['totalResults'] as int?,
        articles: (json['articles'] as List<dynamic>?)
            ?.map((e) => Article.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  
}
