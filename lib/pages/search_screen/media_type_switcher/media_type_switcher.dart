import 'package:flutter/material.dart';
import 'package:uchi_web/pages/search_screen/media_types.dart';
import 'package:uchi_web/shared/colors.dart';
import 'package:uchi_web/shared/no_blink_inkwell.dart';

class MediaTypeSwitcher extends StatefulWidget {
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
  State<MediaTypeSwitcher> createState() => _MediaTypeSwitcherState();
}

class _MediaTypeSwitcherState extends State<MediaTypeSwitcher> {
  double? _height = 0;
  double borderRadius = 0;
  bool opened = false;

  _open() {
    if (!opened) {
      setState(() {
        borderRadius = 18;
        _height = 400;
        opened = true;
      });
    }
  }

  _hide() {
    setState(() {
      borderRadius = 0;
      _height = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => _open());
    return Container(
      color: Colors.black.withAlpha(100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: NoBlinkInkWell(
              child: Container(),
              onTap: () {
                _hide();
                Future.delayed(Duration(milliseconds: 100), () {
                  widget.close();
                });
              },
            ),
          ),
          AnimatedContainer(
            height: _height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(borderRadius),
                topRight: Radius.circular(borderRadius),
              ),
              color: Colors.white,
            ),
            duration: Duration(milliseconds: 100),
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
                          fontWeight: widget.curType == MediaType.article
                              ? FontWeight.bold
                              : FontWeight.normal,
                          fontFamily: "SF-Pro-Display",
                          color: widget.curType == MediaType.article
                              ? backgroundBright
                              : Colors.black,
                        ),
                      ),
                      onTap: () {
                        _hide();
                        Future.delayed(Duration(milliseconds: 100), () {
                          widget.switchType(MediaType.article);
                        });
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
                          fontWeight: widget.curType == MediaType.video
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: widget.curType == MediaType.video
                              ? backgroundBright
                              : Colors.black,
                        ),
                      ),
                      onTap: () {
                        _hide();
                        Future.delayed(Duration(milliseconds: 100), () {
                          widget.switchType(MediaType.video);
                        });
                      },
                    ),
                    Container(
                      height: 20,
                    ),
                    NoBlinkInkWell(
                      child: Text(
                        'Картинки',
                        style: TextStyle(
                          fontSize: 20,
                          fontFamily: "SF-Pro-Display",
                          fontWeight: widget.curType == MediaType.picture
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: widget.curType == MediaType.picture
                              ? backgroundBright
                              : Colors.black,
                        ),
                      ),
                      onTap: () {
                        _hide();
                        Future.delayed(Duration(milliseconds: 100), () {
                          widget.switchType(MediaType.picture);
                        });
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
