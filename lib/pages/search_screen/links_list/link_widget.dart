import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uchi_web/shared/colors.dart';
import 'package:uchi_web/shared/models/media_piece.dart';
import 'package:uchi_web/shared/no_blink_inkwell.dart';
import 'package:uchi_web/shared/open_link.dart';
import 'package:uchi_web/shared/showPopup.dart';

class LinkWidget extends StatelessWidget {
  const LinkWidget({Key? key, required this.mediaPiece}) : super(key: key);

  final MediaPiece mediaPiece;

  @override
  Widget build(BuildContext context) {
    return NoBlinkInkWell(
      onTap: () {
        openLink(context, mediaPiece.link);
      },
      child: Container(
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
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
              ),
              clipBehavior: Clip.hardEdge,
              child: Container(
                height: 400,
                child: Stack(
                  children: [
                    Container(
                      height: 400,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        mediaPiece.imageLink ??
                            "https://filestore.community.support.microsoft.com/api/images/72e3f188-79a1-465f-90ca-27262d769841",
                        filterQuality: FilterQuality.none,                    
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 400,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black,
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(),
                        Expanded(child: Container()),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            mediaPiece.name,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.white,
                              fontFamily: "SF-Pro-Display",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      mediaPiece.link,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 20,
                        color: grey,
                        fontWeight: FontWeight.bold,
                        fontFamily: "SF-Pro-Display",
                      ),
                    ),
                  ),
                  NoBlinkInkWell(
                    child: Icon(
                      Icons.copy,
                      size: 25,
                      color: dark,
                    ),
                    onTap: () {
                      Clipboard.setData(
                          new ClipboardData(text: mediaPiece.link));
                      showPopup(context, "copied");
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
