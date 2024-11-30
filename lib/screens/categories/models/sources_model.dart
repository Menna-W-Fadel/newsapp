class Sources {
  String? status;
  List<Sources1>? sources;

  Sources({this.status, this.sources});

  Sources.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    sources = json["sources"] == null
        ? null
        : (json["sources"] as List).map((e) => Sources1.fromJson(e)).toList();
  }

  static List<Sources> fromList(List<Map<String, dynamic>> list) {
    return list.map(Sources.fromJson).toList();
  }
}

class Sources1 {
  String? id;
  String? name;
  String? description;
  String? url;
  String? category;
  String? language;
  String? country;

  Sources1(
      {this.id,
      this.name,
      this.description,
      this.url,
      this.category,
      this.language,
      this.country});

  Sources1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    url = json["url"];
    category = json["category"];
    language = json["language"];
    country = json["country"];
  }

  static List<Sources1> fromList(List<Map<String, dynamic>> list) {
    return list.map(Sources1.fromJson).toList();
  }
}
