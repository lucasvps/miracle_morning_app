import 'package:miracle_morning_app/app/core/repositories/category_repository.dart';
import 'package:mobx/mobx.dart';

part 'categories_store.g.dart';

class CategoriesStore = _CategoriesStoreBase with _$CategoriesStore;

abstract class _CategoriesStoreBase with Store {
  final CategoryRepository repository;

  _CategoriesStoreBase(this.repository);


  @action
  chooseCategory(idCat) async {
    await repository.chooseCategory(idCat);
  }

}