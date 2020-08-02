import 'package:miracle_morning_app/app/modules/chosen_details/chosen_details_store.dart';
import 'package:mobx/mobx.dart';

part 'chosen_details_controller.g.dart';

class ChosenDetailsController = _ChosenDetailsControllerBase
    with _$ChosenDetailsController;

abstract class _ChosenDetailsControllerBase with Store {
  final ChosenDetailsStore store;

  _ChosenDetailsControllerBase(this.store);
}
