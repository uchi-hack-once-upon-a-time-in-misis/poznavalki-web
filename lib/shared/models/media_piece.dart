import 'dart:convert';

class MediaPiece {
  String name;
  String? imageLink;
  String link;
  MediaPiece({
    required this.name,
    required this.link,
    this.imageLink,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageLink': imageLink,
      'link': link,
    };
  }

  factory MediaPiece.fromMap(Map<String, dynamic> map) {
    return MediaPiece(
      name: map['name'],
      imageLink: map['imageLink'],
      link: map['link'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaPiece.fromJson(String source) => MediaPiece.fromMap(json.decode(source));
}
