import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miracle_morning_app/app/core/stores/auth_store.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'package:miracle_morning_app/app/core/widgets.dart/custom_drawer.dart';
import 'package:miracle_morning_app/app/modules/categories/categories_page.dart';
import 'package:miracle_morning_app/app/modules/category_chosen/category_chosen_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  final tabs = [CategoryChosenPage(), CategoriesPage()];

  SharedPreferences sharedPreferences;

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      Modular.get<AuthStore>()
          .setUserEmail(sharedPreferences.getString('userEmail'));
      Modular.get<AuthStore>()
          .setUserName(sharedPreferences.getString('userName'));
    } else {
      Modular.to.pushReplacementNamed('/login');
    }
  }

  @override
  void initState() {
    checkLoginStatus();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        drawer: CustomDrawer(),
        bottomNavigationBar: CurvedNavigationBar(
            buttonBackgroundColor: Colors.yellow,
            backgroundColor: AppThemeLight().getTheme().primaryColor,
            index: controller.store.currentIndex,
            onTap: (index) {
              controller.store.currentIndex = index;
            },
            items: <Widget>[
              Icon(
                EvaIcons.activity,
                color: Colors.black,
              ),
              Icon(EvaIcons.list, color: Colors.black),
            ]),
        backgroundColor: AppThemeLight().getTheme().backgroundColor,
        appBar: AppBar(
          actions: <Widget>[
            GestureDetector(
              onTap: () {
                
                Modular.get<AuthStore>().logout();
                //Modular.get<CategoryChosenController>().localNotification.pushNotification();
              },
              child: Icon(EvaIcons.logOutOutline),
            )
          ],
          backgroundColor: AppThemeLight().getTheme().primaryColor,
          title: Text('O milagre da manhã'),
          centerTitle: true,
        ),
        body: tabs[controller.store.currentIndex],
      );
    });
  }
}
