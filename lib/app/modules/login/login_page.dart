import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'package:miracle_morning_app/app/core/widgets.dart/components.dart';
import 'package:miracle_morning_app/app/models/user_model.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  //use 'controller' variable to access controller

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        //backgroundColor: Color(0xffBBDEFB),
        appBar: AppBar(
          backgroundColor: AppThemeLight().getTheme().primaryColor,
          title: Text(
            'Realizar Login',
            style: GoogleFonts.montserrat(),
          ),
          centerTitle: true,
        ),
        body: Observer(builder: (_) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(
                  'lib/app/assets/svg/nature.svg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                  child: TextField(
                    onChanged: controller.loginStore.setEmail,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: Icon(Icons.email),
                        labelText: "Email",
                        
                        errorText: controller.validateEmail(),
                        errorStyle: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Observer(builder: (_) {
                      return TextField(
                        obscureText: controller.loginStore.isObscure,
                        onChanged: controller.loginStore.setPassword,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: Icon(Icons.lock),
                            suffixIcon: controller.loginStore.isObscure
                                ? IconButton(
                                    icon: Icon(Icons.visibility_off),
                                    onPressed:
                                        controller.loginStore.changeObscure)
                                : IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed:
                                        controller.loginStore.changeObscure),
                            labelText: "Senha",
                            errorText: controller.validatePass(),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                      );
                    })),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      color: Color(0xff50B5BA),
                      onPressed: controller.isLoginValid()
                          ? () {
                              var userLogin = UserModel(
                                  email: controller.loginStore.email,
                                  password: controller.loginStore.password);

                              controller.login(userLogin).then((value) {
                                Components.onLoading(context);
                                Future.delayed(new Duration(seconds: 3), () {})
                                    .then((value) {
                                  Navigator.pop(context);
                                  Modular.to.pushReplacementNamed('/home');
                                });
                              }).catchError((err) {
                                Components.onLoading(context);
                                Future.delayed(new Duration(seconds: 2), () {})
                                    .then((value) {
                                  Navigator.pop(context);
                                  Components.alert(
                                    context,
                                    'Não foi possivel realizar login!',
                                    'Email ou senha estão incorretos, tente novamente!',
                                  );
                                });
                              });
                            }
                          : null,
                      child: Text('LOGIN',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('/register');
                    },
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Novo aqui ? Faça seu registro rapidamente!',
                          style: GoogleFonts.lato(
                              fontSize: 16, color: Colors.black)),
                    )),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
