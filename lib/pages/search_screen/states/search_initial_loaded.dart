import 'package:uchi_web/pages/search_screen/states/search_state.dart';
import 'package:uchi_web/shared/models/search_request.dart';

class SearchInitialLoaded extends SearchState {
  List<SearchRequest> lastSearches;
  SearchInitialLoaded({
    required this.lastSearches,
  });
}
