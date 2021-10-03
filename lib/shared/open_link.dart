import 'package:flutter/cupertino.dart';
import 'package:uchi_web/shared/showPopup.dart';
import 'package:url_launcher/url_launcher.dart';

openLink(BuildContext context, String url) async {
  if (await canLaunch(url))
    await launch(url);
  else
    showPopup(context, 'couldn\'t launch url');
}
