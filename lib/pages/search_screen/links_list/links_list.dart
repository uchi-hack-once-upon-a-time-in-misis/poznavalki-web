import 'package:flutter/material.dart';
import 'package:uchi_web/pages/search_screen/links_list/link_widget.dart';
import 'package:uchi_web/shared/colors.dart';
import 'package:uchi_web/shared/models/media_piece.dart';

class LinksList extends StatelessWidget {
  LinksList({Key? key, required this.mediaPieces}) : super(key: key);

  List<MediaPiece> mediaPieces;

  @override
  Widget build(BuildContext context) {
    int length = mediaPieces.length;
    if (length == 0) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Text(
          'Ничего не нашлось',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: buttonDark,
            fontFamily: "SF-Pro-Display",
            fontWeight: FontWeight.w600,
          ),
        ),
      );
    }
    int i = 0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: mediaPieces.map((e) {
        ++i;
        return Container(
          child: LinkWidget(
            mediaPiece: e,
          ),
          padding: EdgeInsets.only(bottom: i < length ? 20 : 0),
        );
      }).toList(),
    );
    // return ListView.builder(
    //   padding: EdgeInsets.all(0),
    //   physics: BouncingScrollPhysics(),
    //   itemCount: mediaPieces.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     return LinkWidget(
    //       mediaPiece: mediaPieces[index],
    //     );
    //   },
    // );
  }
}
