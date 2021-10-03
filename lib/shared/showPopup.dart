import 'package:flutter/material.dart';
import 'package:uchi_web/shared/colors.dart';

showPopup(BuildContext context,String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: button,
    content: Text(text),
  ));
}
