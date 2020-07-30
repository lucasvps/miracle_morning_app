import 'package:miracle_morning_app/app/core/repositories/category_repository.dart';
import 'package:miracle_morning_app/app/modules/categories/categories_store.dart';
import 'package:miracle_morning_app/app/modules/category_detail/category_detail_controller.dart';

import 'categories_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'categories_page.dart';

class CategoriesModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CategoriesController(i.get())),
        Bind((i) => CategoriesStore(i.get())),
        Bind((i) => CategoryRepository()),
        Bind((i) => CategoryDetailController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CategoriesPage()),
      ];

  static Inject get to => Inject<CategoriesModule>.of();
}
