import 'package:flutter/material.dart';
import 'package:uchi_web/pages/search_screen/searches_list.dart/search_widget.dart';
import 'package:uchi_web/shared/colors.dart';
import 'package:uchi_web/shared/models/search_request.dart';

class SearchesList extends StatelessWidget {
  SearchesList({Key? key, required this.searchRequests,required this.isScrolling}) : super(key: key);

  List<SearchRequest> searchRequests;
  bool isScrolling;

  @override
  Widget build(BuildContext context) {
    if (searchRequests.length == 0) {
      return Container(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 60,
              ),
              Container(
                width: 200,
                child: Image.asset('assets/Learning-pana-1.png'),
              ),
              Text(
                'Здесь появится история ваших запросов',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: dark,
                  fontFamily: "SF-Pro-Display",
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 20,
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.all(0),
      physics: BouncingScrollPhysics(),
      itemCount: searchRequests.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 20,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return SearchWidget(
          searchRequest: searchRequests[index],
        );
      },
    );
  }
}
