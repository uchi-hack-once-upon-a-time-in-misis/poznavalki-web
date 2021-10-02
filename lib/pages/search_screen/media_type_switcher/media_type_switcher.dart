import 'package:flutter/material.dart';
import 'package:uchi_web/pages/search_screen/media_types.dart';
import 'package:uchi_web/shared/colors.dart';
import 'package:uchi_web/shared/no_blink_inkwell.dart';

class MediaTypeSwitcher extends StatelessWidget {
  const MediaTypeSwitcher(
      {Key? key,
      required this.close,
      required this.switchType,
      required this.curType})
      : super(key: key);

  final MediaType curType;
  final Function close;
  final void Function(MediaType) switchType;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withAlpha(100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: NoBlinkInkWell(
              child: Container(),
              onTap: () {
                close();
              },
            ),
          ),
          Container(
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
              color: Colors.white,
            ),
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    NoBlinkInkWell(
                      child: Text(
                        'Статьи',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: curType == MediaType.article
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontFamily: "SF-Pro-Display",
                          color: curType == MediaType.article
                              ? backgroundBright
                              : Colors.black,
                        ),
                      ),
                      onTap: () {
                        switchType(MediaType.article);
                      },
                    ),
                    Container(
                      height: 20,
                    ),
                    NoBlinkInkWell(
                      child: Text(
                        'Видео',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "SF-Pro-Display",
                          fontWeight: curType == MediaType.video
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: curType == MediaType.video
                              ? backgroundBright
                              : Colors.black,
                        ),
                      ),
                      onTap: () {
                        switchType(MediaType.video);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
