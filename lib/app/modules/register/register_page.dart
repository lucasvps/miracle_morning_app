import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:miracle_morning_app/app/core/themes/light_theme.dart';
import 'package:miracle_morning_app/app/core/widgets.dart/components.dart';
import 'package:miracle_morning_app/app/models/user_model.dart';
import 'package:miracle_morning_app/app/modules/category_chosen/category_chosen_controller.dart';
import 'register_controller.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key key, this.title = "Register"}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState
    extends ModularState<RegisterPage, RegisterController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppThemeLight().getTheme().primaryColor,
          title: Text('Fazer Registro'),
          centerTitle: true,
        ),
        body: Observer(builder: (context) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SvgPicture.asset(
                  'lib/app/assets/svg/register.svg',
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.3,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                  child: TextField(
                    onChanged: controller.store.setName,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: Icon(EvaIcons.personAdd),
                        labelText: "Nome",
                        errorText: controller.store.validateName(),
                        errorStyle: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30)))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                  child: TextField(
                    onChanged: controller.store.setEmail,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        prefixIcon: Icon(EvaIcons.email),
                        labelText: "Email",
                        errorText: controller.store.validateMail(),
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
                        obscureText: controller.store.isObscure,
                        onChanged: controller.store.setPassword,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: Icon(EvaIcons.lock),
                            suffixIcon: controller.store.isObscure
                                ? IconButton(
                                    icon: Icon(Icons.visibility_off),
                                    onPressed: controller.store.changeObscure)
                                : IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: controller.store.changeObscure),
                            labelText: "Senha",
                            errorText: controller.store.validatePass(),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)))),
                      );
                    })),
                Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    child: Observer(builder: (_) {
                      return TextField(
                        obscureText: controller.store.isObscure,
                        onChanged: controller.store.setConfirmPassword,
                        decoration: InputDecoration(
                            errorStyle: TextStyle(
                                color: Colors.redAccent,
                                fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.zero,
                            prefixIcon: Icon(EvaIcons.lock),
                            suffixIcon: controller.store.isObscure
                                ? IconButton(
                                    icon: Icon(Icons.visibility_off),
                                    onPressed: controller.store.changeObscure)
                                : IconButton(
                                    icon: Icon(Icons.visibility),
                                    onPressed: controller.store.changeObscure),
                            labelText: "Confirmar Senha",
                            errorText:
                                controller.store.confirmPasswordValidate(),
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
                      onPressed: controller.store.isRegisterValid
                          ? () {
                              var registerUser = UserModel(
                                name: controller.store.name,
                                  email: controller.store.email,
                                  password: controller.store.password);

                              controller.store.authRepository.register(registerUser).then((value) {
                                Components.onLoading(context);
                                Future.delayed(new Duration(seconds: 3), () {})
                                    .then((value) {
                                  Navigator.pop(context);
                                  Modular.to.pushNamedAndRemoveUntil('/slides', ModalRoute.withName('/slides'));
                                  controller.localNotification.pushNotification();
                                });
                              }).catchError((err) {
                                Components.onLoading(context);
                                Future.delayed(new Duration(seconds: 2), () {})
                                    .then((value) {
                                  Navigator.pop(context);
                                  Components.alert(
                                    context,
                                    'Não foi possivel realizar registro!',
                                    'Email já cadastrado!',
                                  );
                                });
                              });
                            }
                          : null,
                      child: Text('REGISTRAR',
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.bold, fontSize: 20)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }));
  }
}
