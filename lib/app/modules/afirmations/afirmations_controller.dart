import 'package:mobx/mobx.dart';

part 'afirmations_controller.g.dart';

class AfirmationsController = _AfirmationsControllerBase
    with _$AfirmationsController;

abstract class _AfirmationsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
