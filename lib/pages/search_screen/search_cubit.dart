import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uchi_web/pages/search_screen/states/search_finging.dart';
import 'package:uchi_web/pages/search_screen/states/search_found.dart';
import 'package:uchi_web/pages/search_screen/states/search_initial_loaded.dart';
import 'package:uchi_web/pages/search_screen/states/search_initial_loading.dart';
import 'package:uchi_web/pages/search_screen/states/search_state.dart';
import 'package:uchi_web/shared/models/media_piece.dart';
import 'package:uchi_web/shared/models/search_request.dart';
import 'package:uchi_web/shared/models/search_result.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitialLoading()) {
    _loadLastSearches();
  }

  _loadLastSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    List<SearchRequest>? searches = prefs
        .getStringList('searches')
        ?.map((e) => SearchRequest(
              theme: e.split(SearchResult.localPrefDiv)[0],
              body: e.split(SearchResult.localPrefDiv)[1],
            ))
        .toList();

    searches=searches?.reversed.toList();

    emit(SearchInitialLoaded(lastSearches: searches ?? []));
  }

  loadContent(String theme, String body) async {
    emit(SearchFinding(theme: theme, body: body));

    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool saveHistory = prefs.getBool('saveHistory') ?? true;

    if (saveHistory) {
      prefs.setStringList(
        'searches',
        (prefs.getStringList('searches') ?? <String>[]) +
            ["${theme}${SearchResult.localPrefDiv}${body}"],
      );
    }

    SearchResult result = SearchResult(
      arlicles: [
        MediaPiece(link: "https://vk.com/im", name: "sdasdsadas"),
        MediaPiece(link: "hts:link2", name: "sdasdsadas"),
        MediaPiece(
            link:
                "hts:link2link2link2linlink2link2link2liink2link2link2linlink2link2link2liink2link2link2linlink2link2link2liink2link2link2linlink2link2link2liink2link2link2linlink2link2link2link2link2link2",
            name: "sdasdsadas"),
        MediaPiece(link: "hts:link2", name: "sdasdsadas"),
        MediaPiece(link: "hts:link2", name: "sdasdsadas"),
        MediaPiece(
            link: "hts:link2",
            name:
                "sdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdassdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdassdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdassdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadassdasdsadas"),
        MediaPiece(
            link: "hts:link1",
            name: "sdasdsadas",
            imageLink:
                "https://www.aluminati.net/wp-content/uploads/2016/03/img-placeholder.png")
      ],
      videos: [],
    );
    emit(SearchFound(searchResult: result, theme: theme, body: body));
  }
}
