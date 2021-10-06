import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uchi_web/pages/search_screen/header_content/header_content.dart';
import 'package:uchi_web/pages/search_screen/links_list/links_list.dart';
import 'package:uchi_web/pages/search_screen/media_type_switcher/media_type_switcher.dart';
import 'package:uchi_web/pages/search_screen/media_types.dart';
import 'package:uchi_web/pages/search_screen/search_cubit.dart';
import 'package:uchi_web/pages/search_screen/searches_list.dart/searches_list.dart';
import 'package:uchi_web/pages/search_screen/states/search_finging.dart';
import 'package:uchi_web/pages/search_screen/states/search_found.dart';
import 'package:uchi_web/pages/search_screen/states/search_initial_loaded.dart';
import 'package:uchi_web/pages/search_screen/states/search_initial_loading.dart';
import 'package:uchi_web/pages/search_screen/states/search_state.dart';
import 'package:uchi_web/shared/colors.dart';
import 'package:uchi_web/shared/models/media_piece.dart';
import 'package:uchi_web/shared/no_blink_inkwell.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  MediaType mediaType = MediaType.article;
  bool mediaTypeSwitcherShown = false;

  bool _scrollingBuilder = false;

  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        _scrollingBuilder = _scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent;
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: backgroundBright,
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      (() {
                        if (state is SearchFinding) {
                          return HeaderContent(
                            initBody: state.body,
                            initTheme: state.theme,
                          );
                        }
                        if (state is SearchFound) {
                          return HeaderContent(
                            initBody: state.body,
                            initTheme: state.theme,
                          );
                        }
                        return HeaderContent();
                      }()),
                      (() {
                        if (state is SearchInitialLoaded ||
                            state is SearchInitialLoading) {
                          return Container(
                            padding: EdgeInsets.only(top: 20),
                            child: Column(
                              children: [
                                Row(),
                                Text(
                                  'Ранее искали',
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontFamily: "SF-Pro-Display",
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_drop_down_rounded,
                                  size: 40,
                                  color: Colors.white.withOpacity(0.4),
                                ),
                              ],
                            ),
                          );
                        }
                        if (state is SearchFound || state is SearchFinding) {
                          return Container(
                            padding: EdgeInsets.only(top: 24, bottom: 12),
                            child: NoBlinkInkWell(
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    mediaType.toPlural(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.white,
                                      fontFamily: "SF-Pro-Display",
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  Icon(
                                    Icons.arrow_drop_down_rounded,
                                    size: 40,
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                ],
                              ),
                              onTap: () {
                                setState(() {
                                  mediaTypeSwitcherShown = true;
                                });
                              },
                            ),
                          );
                        }
                        return Container();
                      }()),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(18),
                              topRight: Radius.circular(18)),
                          color: background,
                        ),
                        constraints: BoxConstraints(
                            minHeight: 100,
                            maxHeight: MediaQuery.of(context).size.height),
                        clipBehavior: Clip.hardEdge,
                        child: Stack(
                          children: [
                            Container(
                              child: (() {
                                if (state is SearchInitialLoaded) {
                                  return (() {
                                    return SearchesList(
                                      searchRequests: state.lastSearches,
                                      isScrolling: _scrollingBuilder,
                                    );
                                  }());
                                }
                                if (state is SearchFound) {
                                  return LinksList(
                                    mediaPieces: (() {
                                      if (mediaType == MediaType.article) {
                                        return state.searchResult.sites;
                                      }
                                      if (mediaType == MediaType.video) {
                                        return state.searchResult.vids;
                                      }
                                      if (mediaType == MediaType.picture) {
                                        return state.searchResult.pics;
                                      }
                                      return <MediaPiece>[];
                                    }()),
                                    isScrolling: _scrollingBuilder,
                                  );
                                }
                                return Container();
                              }()),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                (() {
                  if (mediaTypeSwitcherShown) {
                    return MediaTypeSwitcher(
                      curType: mediaType,
                      close: () {
                        setState(() {
                          mediaTypeSwitcherShown = false;
                        });
                      },
                      switchType: (MediaType type) {
                        setState(() {
                          mediaType = type;
                          mediaTypeSwitcherShown = false;
                        });
                      },
                    );
                  }
                  return Container();
                }()),
              ],
            );
          },
        ),
      ),
    );
  }
}
