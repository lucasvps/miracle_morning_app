import 'package:miracle_morning_app/app/core/repositories/category_repository.dart';
import 'package:mobx/mobx.dart';

part 'chosen_done_store.g.dart';

class ChosenDoneStore = _ChosenDoneStoreBase with _$ChosenDoneStore;

abstract class _ChosenDoneStoreBase with Store {
  final CategoryRepository repository;

  _ChosenDoneStoreBase(this.repository);
}