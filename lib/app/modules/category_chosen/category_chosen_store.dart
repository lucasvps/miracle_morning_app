import 'package:miracle_morning_app/app/core/repositories/category_repository.dart';
import 'package:miracle_morning_app/app/core/repositories/date_status_repository.dart';
import 'package:miracle_morning_app/app/models/date_status_model.dart';
import 'package:mobx/mobx.dart';

part 'category_chosen_store.g.dart';

class CategoryChosenStore = _CategoryChosenStoreBase with _$CategoryChosenStore;

abstract class _CategoryChosenStoreBase with Store {
  final CategoryRepository repository;
  final DateStatusRepository dateStatusRepository;

  _CategoryChosenStoreBase(this.repository, this.dateStatusRepository);

  @action
  markAsDone(int id, String date, int status) {
    DateStatusModel model =
        DateStatusModel(categoryChosenId: id, date: date, status: status);

    dateStatusRepository.markDateStatus(model).then((value){
      idDoneToday.clear();
      dateStatusRepository.ifTodayAlreadyMarked();
    });
    
    
  }


  @observable
  List<dynamic> idDoneToday = [];

  


}
