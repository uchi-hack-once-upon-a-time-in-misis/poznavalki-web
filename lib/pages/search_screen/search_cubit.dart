import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uchi_web/pages/search_screen/states/search_finging.dart';
import 'package:uchi_web/pages/search_screen/states/search_found.dart';
import 'package:uchi_web/pages/search_screen/states/search_initial_loaded.dart';
import 'package:uchi_web/pages/search_screen/states/search_initial_loading.dart';
import 'package:uchi_web/pages/search_screen/states/search_state.dart';
import 'package:uchi_web/shared/models/media_piece.dart';
import 'package:uchi_web/shared/models/search_request.dart';
import 'package:uchi_web/shared/models/search_result.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialLoading()) {
    _loadLastSearches();
  }

  _loadLastSearches() async {
    List<SearchRequest> lastSearches = [];
    emit(SearchInitialLoaded(lastSearches: lastSearches));
  }

  loadContent() async {
    emit(SearchFinding());
    SearchResult result = SearchResult(
      arlicles: [
        MediaPiece(link: "hts:link2", name: "sdasdsadas"),
        MediaPiece(link: "hts:link2", name: "sdasdsadas"),
        MediaPiece(link: "hts:link2", name: "sdasdsadas"),
        MediaPiece(link: "hts:link2", name: "sdasdsadas"),
        MediaPiece(link: "hts:link2", name: "sdasdsadas"),
        MediaPiece(link: "hts:link2", name: "sdasdsadas"),
        MediaPiece(
            link: "hts:link1",
            name: "sdasdsadas",
            imageLink:
                "https://www.aluminati.net/wp-content/uploads/2016/03/img-placeholder.png")
      ],
      videos: [],
    );
    emit(SearchFound(searchResult: result));
  }
}
