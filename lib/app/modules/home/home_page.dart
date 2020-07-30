import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fleva_icons/fleva_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'package:miracle_morning_app/app/modules/categories/categories_page.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  final tabs = [CategoriesPage(), CategoriesPage(), CategoriesPage()];

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
            buttonBackgroundColor: Colors.yellow,
            backgroundColor: AppThemeLight().getTheme().primaryColor,
            index: controller.store.currentIndex,
            onTap: (index) {
              controller.store.currentIndex = index;
            },
            items: <Widget>[
              Icon(EvaIcons.activity, color: Colors.black,),
              Icon(EvaIcons.list, color: Colors.black),
              Icon(EvaIcons.person, color: Colors.black),
            ]),
        backgroundColor: Color(0xffb9d7d9),
        appBar: AppBar(
          backgroundColor: Color(0xff50B5BA),
          title: Text('O milagre da manhã'),
          centerTitle: true,
        ),
        body: tabs[controller.store.currentIndex],
      );
    });
  }
}
