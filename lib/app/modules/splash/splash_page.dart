import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:miracle_morning_app/app/core/stores/auth_store.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    checkLoginStatus();
    super.initState();
  }

  SharedPreferences sharedPreferences;

  checkLoginStatus() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.getString('token') != null) {
      Modular.to.pushReplacementNamed('/home');
      Modular.get<AuthStore>()
          .setUserEmail(sharedPreferences.getString('userEmail'));
      Modular.get<AuthStore>()
          .setUserName(sharedPreferences.getString('userName'));
    } else {
      Modular.to.pushReplacementNamed('/login');
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //Image.asset('lib/assets/images/reports.png'),
          Center(
            child: CircularProgressIndicator(),
          )
        ],
      ),
    );
  }
}
