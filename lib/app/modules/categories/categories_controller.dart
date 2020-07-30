import 'package:miracle_morning_app/app/models/category_model.dart';
import 'package:miracle_morning_app/app/modules/categories/categories_store.dart';
import 'package:mobx/mobx.dart';

part 'categories_controller.g.dart';

class CategoriesController = _CategoriesControllerBase
    with _$CategoriesController;

abstract class _CategoriesControllerBase with Store {
  final CategoriesStore store;

  _CategoriesControllerBase(this.store){
    categories = store.repository.getCategories().asObservable();
  }

  @observable
  ObservableFuture<List<CategoryModel>> categories;

}
