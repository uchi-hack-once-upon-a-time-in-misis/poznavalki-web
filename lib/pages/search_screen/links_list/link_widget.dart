import 'package:flutter/material.dart';
import 'package:uchi_web/shared/models/media_piece.dart';

class LinkWidget extends StatelessWidget {
  const LinkWidget({Key? key, required this.mediaPiece}) : super(key: key);

  final MediaPiece mediaPiece;

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
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 5),
      child: (() {
        if (mediaPiece.imageLink != null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                ),
                clipBehavior: Clip.hardEdge,
                child: Container(
                  height: 300,
                  child: Stack(
                    children: [
                      Container(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          mediaPiece.imageLink!,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
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
                        children: [
                          Container(height: 150),
                          Container(
                            height: 150,
                            child: Center(
                              child: Text(
                                mediaPiece.name,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontFamily: "SF-Pro-Display",
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Text(
                mediaPiece.link,
                textAlign: TextAlign.center,
              ),
            ],
          );
        }
        return Column(
          children: [
            Text(mediaPiece.name),
            Text(mediaPiece.link),
          ],
        );
      }()),
    );
  }
}
