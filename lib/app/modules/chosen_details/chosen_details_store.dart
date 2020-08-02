import 'package:miracle_morning_app/app/core/repositories/date_status_repository.dart';
import 'package:miracle_morning_app/app/models/date_status_model.dart';
import 'package:mobx/mobx.dart';

part 'chosen_details_store.g.dart';

class ChosenDetailsStore = _ChosenDetailsStoreBase with _$ChosenDetailsStore;

abstract class _ChosenDetailsStoreBase with Store {
  final DateStatusRepository repository;

  _ChosenDetailsStoreBase(this.repository);

  Future<List<DateStatusModel>> dateStatusByChosen(id) async {
    return await repository.dateStatusByChosen(id);


    
  }

  @observable
  int totalDone = 0;

  @action
  increaseTotalDone() => totalDone += 1;

  @observable
  int totalLost = 0;

  @action
  increaseTotalLost() => totalLost += 1;
}