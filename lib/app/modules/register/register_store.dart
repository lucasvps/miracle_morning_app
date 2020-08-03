import 'package:email_validator/email_validator.dart';
import 'package:miracle_morning_app/app/core/interfaces/auth_repository_interface.dart';
import 'package:mobx/mobx.dart';

part 'register_store.g.dart';

class RegisterStore = _RegisterStoreBase with _$RegisterStore;

abstract class _RegisterStoreBase with Store {

  final IAuthRepository authRepository;
  _RegisterStoreBase(this.authRepository);

  @observable
  bool isObscure = true;

  @action
  void changeObscure() => isObscure = !isObscure; 

  @observable
  String email;


  @action
  setEmail(String value) => email = value;

  @observable
  String name;

  @action
  setName(String value) => name = value;


  @observable
  String password;

  @action
  setPassword(String value) => password = value;

  @observable
  String confirmPassword;

  @action
  setConfirmPassword(String value) => confirmPassword = value;

  @computed
  bool get isRegisterValid{
    return validateMail() == null && validatePass() == null && validateName() == null && confirmPasswordValidate() == null;
  }

  String validateMail() {
    if (email == null || email.isEmpty) {
      return "Campo obrigatório";
    } else if (!EmailValidator.validate(email)) {
      return "Este nao é um email valido";
    }

    return null;
  }

  String validatePass() {
    if (password == null || password.isEmpty) {
      return "Campo obrigatório";
    } else if (password.length < 6) {
      return "A senha necessita ter mais que do 6 caracteres";
    }

    return null;
  }

  String validateName() {
    if (name == null || name.isEmpty) {
      return "Campo obrigatório";
    } else if (name.length < 3) {
      return "O nome precisa ter pelo menos 3 caracteres";
    }

    return null;
  }

  String confirmPasswordValidate() {
    if (confirmPassword == null || confirmPassword.isEmpty) {
      return "Campo obrigatório";
    } else if (confirmPassword != password) {
      return "As duas senham precisam ser iguais";
    }

    return null;
  }
}