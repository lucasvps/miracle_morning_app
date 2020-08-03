import 'package:mobx/mobx.dart';

part 'intro_slider_controller.g.dart';

class IntroSliderController = _IntroSliderControllerBase
    with _$IntroSliderController;

abstract class _IntroSliderControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
