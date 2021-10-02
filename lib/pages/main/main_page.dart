import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uchi_web/pages/search_screen/search_cubit.dart';
import 'package:uchi_web/pages/search_screen/search_screen.dart';
import 'package:uchi_web/shared/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String screen = "main";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      body: Column(
        children: [
          // Expanded(
          //   child: Container(
          //     color: backgroundBright,
          //     height: 10000,
          //   ),
          // ),
          (() {
            switch (screen) {
              case "main":
                return BlocProvider(
                  create: (c) => SearchCubit(),
                  child: SearchScreen(),
                );
              default:
                return Container();
            }
          }()),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: background,
        child: Row(
          children: [
            IconButton(
              iconSize: 35,
              icon: Icon(Icons.search),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: (() {
                if (screen == "main") {
                  return buttonDark;
                }
                return grey;
              }()),
              onPressed: () {
                setState(() {
                  screen = "main";
                });
              },
            ),
            IconButton(
              iconSize: 35,
              icon: Icon(Icons.settings),
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              color: (() {
                if (screen == "settings") {
                  return buttonDark;
                }
                return grey;
              }()),
              onPressed: () {
                setState(() {
                  screen = "settings";
                });
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),
    );
  }
}
