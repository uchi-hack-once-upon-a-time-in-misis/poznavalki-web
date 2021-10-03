import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uchi_web/shared/button.dart';
import 'package:uchi_web/shared/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool saveHistory = true;

  _loadSaveHistory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      saveHistory = prefs.getBool('saveHistory') ?? true;
    });
  }

  @override
  Widget build(BuildContext context) {
    _loadSaveHistory();
    return Expanded(
      child: Container(
          padding: EdgeInsets.only(left: 20, right: 20, top: 30),
          color: backgroundBright,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Сохранять мои запросы",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "SF-Pro-Display",
                    ),
                  ),
                  Switch(
                    value: saveHistory,
                    onChanged: (value) async {
                      setState(() {
                        saveHistory = value;
                      });
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setBool('saveHistory', saveHistory);
                    },
                    activeColor: button,
                  ),
                ],
              ),
              Container(height: 20),
              Button(
                borderRadius: 16,
                padding: EdgeInsets.all(15),
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setStringList('searches', []);
                },
                color: Colors.white,
                child: Center(
                  child: Text(
                    'Сбросить историю поиска',
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "SF-Pro-Display",
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
