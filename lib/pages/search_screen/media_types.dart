import 'package:uchi_web/shared/models/media_piece.dart';

enum MediaType { article, video }

extension MediaTypeExtension on MediaType {
  String toPlural() {
    if (this == MediaType.article) return "Статьи";
    if (this == MediaType.video)
      return "Видео";
    else
      return "";
  }
}
