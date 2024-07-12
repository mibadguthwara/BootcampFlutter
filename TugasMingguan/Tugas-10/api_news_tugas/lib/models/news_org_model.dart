class NewsOrgModel {
  String? author;
  String? title;
  String? description;
  String? urlToImage;
  String? publishedAt;

  NewsOrgModel({
    this.author,
    this.title,
    this.description,
    this.urlToImage,
    this.publishedAt,
  });

  NewsOrgModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    title = json['title'];
    description = json['description'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
  }
}
