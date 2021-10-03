import 'dart:convert';

import 'package:uchi_web/shared/models/media_piece.dart';

class SearchResult {
  static const localPrefDiv = "'..''.'.'.'..sfe..'.";

  List<MediaPiece> sites;
  List<MediaPiece> vids;
  List<MediaPiece> pics;
  SearchResult({required this.sites, required this.vids, required this.pics});

  Map<String, dynamic> toMap() {
    return {
      'sites': sites.map((x) => x.toMap()).toList(),
      'vids': vids.map((x) => x.toMap()).toList(),
      'pics': pics.map((x) => x.toMap()).toList(),
    };
  }

  factory SearchResult.fromMap(Map<String, dynamic> map) {
    return SearchResult(
      sites: List<MediaPiece>.from(
          map['sites']?.map((x) => MediaPiece.fromList(x))),
      vids:
          List<MediaPiece>.from(map['vids']?.map((x) => MediaPiece.fromList(x))),
      pics:
          List<MediaPiece>.from(map['pics']?.map((x) => MediaPiece.fromList(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SearchResult.fromJson(String source) =>
      SearchResult.fromMap(json.decode(source));
}
