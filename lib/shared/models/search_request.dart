import 'dart:convert';

class SearchRequest {
  String theme;
  String body;
  SearchRequest({
    required this.theme,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'theme': theme,
      'body': body,
    };
  }

  factory SearchRequest.fromMap(Map<String, dynamic> map) {
    return SearchRequest(
      theme: map['theme'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchRequest.fromJson(String source) => SearchRequest.fromMap(json.decode(source));
}
