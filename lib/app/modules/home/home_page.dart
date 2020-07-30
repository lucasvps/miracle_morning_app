import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb9d7d9),
      appBar: AppBar(
        backgroundColor: Color(0xff50B5BA),
        title: Text(widget.title),
      ),
      body: CategoriesPage()
    );
  }
}
