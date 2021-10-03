import 'package:uchi_web/shared/models/media_piece.dart';

class SearchResult {
  static const localPrefDiv = "'..''.'.'.'..sfe..'.";

  List<MediaPiece> arlicles;
  List<MediaPiece> videos;
  SearchResult({
    required this.arlicles,
    required this.videos,
  });
}
