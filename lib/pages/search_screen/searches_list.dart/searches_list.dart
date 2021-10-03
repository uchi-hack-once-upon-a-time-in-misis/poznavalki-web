import 'package:flutter/material.dart';
import 'package:uchi_web/pages/search_screen/searches_list.dart/search_widget.dart';
import 'package:uchi_web/shared/colors.dart';
import 'package:uchi_web/shared/models/search_request.dart';

class SearchesList extends StatelessWidget {
  SearchesList({Key? key, required this.searchRequests}) : super(key: key);

  List<SearchRequest> searchRequests;

  @override
  Widget build(BuildContext context) {
    int length = searchRequests.length;
    if (length == 0) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'Ничего не нашлось',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: dark,
            fontFamily: "SF-Pro-Display",
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
    int i = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: searchRequests.map((e) {
        ++i;
        return Container(
          child: SearchWidget(
            searchRequest: e,
          ),
          padding: EdgeInsets.only(bottom: i < length ? 20 : 0),
        );
      }).toList(),
    );
  }
}
