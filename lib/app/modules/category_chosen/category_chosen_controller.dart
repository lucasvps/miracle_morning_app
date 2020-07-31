import 'package:miracle_morning_app/app/modules/category_chosen/category_chosen_store.dart';
import 'package:mobx/mobx.dart';

part 'category_chosen_controller.g.dart';

class CategoryChosenController = _CategoryChosenControllerBase
    with _$CategoryChosenController;

abstract class _CategoryChosenControllerBase with Store {
  final CategoryChosenStore store;

  _CategoryChosenControllerBase(this.store){
    store.dateStatusRepository.ifTodayAlreadyMarked();
  }
}
