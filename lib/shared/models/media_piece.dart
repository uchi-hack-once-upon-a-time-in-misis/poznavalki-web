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

  factory MediaPiece.fromList(List<String> map) {
    return MediaPiece(
      name: map[0],
      imageLink: map[2],
      link: map[1],
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaPiece.fromJson(String source) => MediaPiece.fromList(json.decode(source));
}
