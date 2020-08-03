
import 'package:miracle_morning_app/app/models/user_model.dart';

abstract class IAuthRepository {
  Future login(UserModel userModel);
  Future register(UserModel userModel);
  Future logout();
  Future getCurrentUser();
  Future refreshToken()
;}
