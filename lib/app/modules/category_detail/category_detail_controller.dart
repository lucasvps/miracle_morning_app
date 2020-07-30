import 'package:mobx/mobx.dart';

part 'category_detail_controller.g.dart';

class CategoryDetailController = _CategoryDetailControllerBase
    with _$CategoryDetailController;

abstract class _CategoryDetailControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
