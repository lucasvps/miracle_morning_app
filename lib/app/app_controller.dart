import 'package:mobx/mobx.dart';

import 'modules/category_chosen/category_chosen_store.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  final CategoryChosenStore store;

  _AppControllerBase(this.store){
    store.idDoneToday.clear();
    store.dateStatusRepository.ifTodayAlreadyMarked();
  }
}
