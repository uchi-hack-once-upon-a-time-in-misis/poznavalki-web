import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uchi_web/pages/search_screen/search_cubit.dart';
import 'package:uchi_web/shared/colors.dart';
import 'package:uchi_web/shared/models/search_request.dart';
import 'package:uchi_web/shared/no_blink_inkwell.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.searchRequest}) : super(key: key);

  final SearchRequest searchRequest;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  searchRequest.theme,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontFamily: "SF-Pro-Display",
                    fontSize: 28,
                    color: dark,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(height: 3),
                  NoBlinkInkWell(
                    onTap: () {
                      BlocProvider.of<SearchCubit>(context)
                          .loadContent(searchRequest.body, searchRequest.body);
                    },
                    child: Icon(
                      Icons.replay,
                      size: 25,
                      color: button,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(height: 12),
          Text(
            searchRequest.body,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontFamily: "SF-Pro-Display",
              fontSize: 17,
              color: dark,
            ),
          ),
        ],
      ),
    );
  }
}
