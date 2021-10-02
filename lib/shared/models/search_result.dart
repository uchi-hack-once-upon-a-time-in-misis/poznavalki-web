import 'package:uchi_web/shared/models/media_piece.dart';

class SearchResult {
  List<MediaPiece> arlicles;
  List<MediaPiece> videos;
  SearchResult({
    required this.arlicles,
    required this.videos,
  });
}
