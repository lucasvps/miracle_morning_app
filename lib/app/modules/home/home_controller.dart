import 'package:miracle_morning_app/app/modules/home/home_store.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final HomeStore store;

  _HomeControllerBase(this.store);
}
