import 'package:miracle_morning_app/app/core/repositories/category_repository.dart';
import 'package:miracle_morning_app/app/modules/categories/categories_controller.dart';
import 'package:miracle_morning_app/app/modules/categories/categories_store.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController()),
        Bind((i) => CategoriesController(i.get())),
        Bind((i) => CategoriesStore(i.get())),
        Bind((i) => CategoryRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
