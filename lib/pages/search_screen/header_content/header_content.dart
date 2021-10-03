import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uchi_web/pages/search_screen/search_cubit.dart';
import 'package:uchi_web/shared/button.dart';
import 'package:uchi_web/shared/colors.dart';

class HeaderContent extends StatelessWidget {
  HeaderContent({Key? key, this.initTheme, this.initBody}) : super(key: key);

  String? initTheme;
  String? initBody;

  late TextEditingController themeController = TextEditingController(text: initTheme);
  late TextEditingController bodyController = TextEditingController(text: initBody);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Познавалки',
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontFamily: "SF-Pro-Display",
              fontWeight: FontWeight.bold,
            ),
          ),
          Container(height: 8),
          Text(
            'Инструмент быстрого подбора материала по теме для учеников и учителей.',
            style: TextStyle(
              fontFamily: "SF-Pro-Display",
              color: Colors.white.withOpacity(0.8),
              fontSize: 16,
            ),
          ),
          Container(
            height: 24,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: TextField(
              controller: themeController,
              style: TextStyle(
                color: dark,
                fontSize: 17,
                fontFamily: "SF-Pro-Display",
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(17),
                hintText: "Введите тему",
                hintStyle: TextStyle(color: grey),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(
            height: 8,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: TextField(
              maxLines: 10,
              minLines: 1,
              controller: bodyController,
              style: TextStyle(
                color: dark,
                fontSize: 17,
                fontFamily: "SF-Pro-Display",
              ),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(17),
                hintText: "Введите описание или материал",
                hintStyle: TextStyle(color: grey),
                border: InputBorder.none,
              ),
            ),
          ),
          Container(height: 18),
          Button(
            borderRadius: 16,
            padding: EdgeInsets.all(15),
            onTap: () {
              BlocProvider.of<SearchCubit>(context)
                  .loadContent(themeController.text, bodyController.text);
            },
            child: Center(
              child: Text(
                'Искать',
                style: TextStyle(
                  fontSize: 17,
                  color: Colors.white,
                  fontFamily: "SF-Pro-Display",
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
