import 'package:miracle_morning_app/app/modules/login/login_store.dart';
import 'package:mobx/mobx.dart';
import 'package:miracle_morning_app/app/models/user_model.dart';


part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final LoginStore loginStore;

  _LoginControllerBase(this.loginStore);

  Future login(UserModel userModel) async {
    return await loginStore.login(userModel);
  }

  String validateEmail() {
    return loginStore.validateMail();
  }

  String validatePass() {
    return loginStore.validatePass();
  }

  bool isLoginValid() {
    return loginStore.isLoginValid;
  }

}
