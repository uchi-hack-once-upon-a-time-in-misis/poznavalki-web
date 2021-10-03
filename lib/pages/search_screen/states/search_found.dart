import 'package:uchi_web/pages/search_screen/states/search_state.dart';
import 'package:uchi_web/shared/models/search_result.dart';

class SearchFound extends SearchState {
  SearchResult searchResult;
  String theme;
  String body;
  SearchFound({
    required this.searchResult,
    required this.theme,
    required this.body,
  });
}
