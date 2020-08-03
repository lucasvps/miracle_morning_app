import 'package:miracle_morning_app/app/core/interfaces/local_notification_interface.dart';
import 'package:miracle_morning_app/app/modules/register/register_store.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterControllerBase with _$RegisterController;

abstract class _RegisterControllerBase with Store {
  final RegisterStore store;
  final ILocalNotification localNotification;

  _RegisterControllerBase(this.store, this.localNotification);
}
