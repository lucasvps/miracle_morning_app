import 'package:miracle_morning_app/app/modules/chosen_done/chosen_done_store.dart';
import 'package:mobx/mobx.dart';

part 'chosen_done_controller.g.dart';

class ChosenDoneController = _ChosenDoneControllerBase
    with _$ChosenDoneController;

abstract class _ChosenDoneControllerBase with Store {
  final ChosenDoneStore store;

  _ChosenDoneControllerBase(this.store);

}
