import 'package:flutter/material.dart';
import 'package:uchi_web/pages/search_screen/links_list/link_widget.dart';
import 'package:uchi_web/shared/colors.dart';
import 'package:uchi_web/shared/models/media_piece.dart';

class LinksList extends StatelessWidget {
  LinksList({Key? key, required this.mediaPieces, required this.isScrolling})
      : super(key: key);

  List<MediaPiece> mediaPieces;
  bool isScrolling;

  @override
  Widget build(BuildContext context) {
    if (mediaPieces.length == 0) {
      return Container(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 60,
              ),
              Text(
                'Ничего не нашлось',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: dark,
                  fontFamily: "SF-Pro-Display",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return ListView.separated(
      padding: EdgeInsets.all(0),
      physics: isScrolling
          ? ClampingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      itemCount: mediaPieces.length,
      separatorBuilder: (BuildContext context, int index) {
        return Container(
          height: 20,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return LinkWidget(
          mediaPiece: mediaPieces[index],
        );
      },
    );
  }
}
