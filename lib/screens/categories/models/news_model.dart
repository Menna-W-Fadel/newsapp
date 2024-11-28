class NewsModel {
  NewsModel({
    required this.id,
    required this.imagePath,
    required this.company,
    required this.title,
    required this.publishedDate,
  });
  String imagePath;
  String title;
  String company;
  String id;
  DateTime publishedDate;
}
