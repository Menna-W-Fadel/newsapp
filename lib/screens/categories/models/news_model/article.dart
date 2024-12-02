
import 'package:newsapp/screens/categories/models/sources_model.dart';




class Article {
  final Sources? source;
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final dynamic urlToImage;
  final String? publishedAt;
  final String? content;

  const Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  @override
  String toString() {
    return 'Article(source: $source, author: $author, title: $title, description: $description, url: $url, urlToImage: $urlToImage, publishedAt: $publishedAt, content: $content)';
  }

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json['source'] == null
            ? null
            : Sources.fromJson(json['source'] as Map<String, dynamic>),
        author: json['author'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        urlToImage: json['urlToImage'] as dynamic,
        publishedAt: json['publishedAt'] as String?,
        content: json['content'] as String?,
      );

}
