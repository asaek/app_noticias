import 'dart:convert';

class NoticiaModel {
  final Source source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;

  NoticiaModel({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  factory NoticiaModel.fromRawJson(String str) =>
      NoticiaModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NoticiaModel.fromJson(Map<String, dynamic> json) => NoticiaModel(
        source: Source.fromJson(json["source"]),
        author: json["author"] ?? 'Sin autor',
        title: json["title"],
        description: json["description"] ?? 'Sin descripción',
        url: json["url"],
        urlToImage: json["urlToImage"] ??
            'https://pbs.twimg.com/media/GAv706gaUAADxXz?format=jpg',
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] ?? 'Sin contenido',
      );

  Map<String, dynamic> toJson() => {
        "source": source.toJson(),
        "author": author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt.toIso8601String(),
        "content": content,
      };
}

class Source {
  final String? id;
  final String name;

  Source({
    required this.id,
    required this.name,
  });

  factory Source.fromRawJson(String str) => Source.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
