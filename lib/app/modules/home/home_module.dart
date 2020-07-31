import 'package:miracle_morning_app/app/core/repositories/category_repository.dart';
import 'package:miracle_morning_app/app/core/repositories/date_status_repository.dart';
import 'package:miracle_morning_app/app/modules/categories/categories_controller.dart';
import 'package:miracle_morning_app/app/modules/categories/categories_store.dart';
import 'package:miracle_morning_app/app/modules/category_chosen/category_chosen_controller.dart';
import 'package:miracle_morning_app/app/modules/category_chosen/category_chosen_store.dart';
import 'package:miracle_morning_app/app/modules/home/home_store.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => HomeController(i.get())),
        Bind((i) => CategoriesController(i.get())),
        Bind((i) => CategoriesStore(i.get())),
        Bind((i) => CategoryRepository()),
        Bind((i) => HomeStore()),
        Bind((i) => CategoryChosenController(i.get())),
        Bind((i) => CategoryChosenStore(i.get(), i.get())),
        Bind((i) => CategoryRepository()),
        Bind((i) => DateStatusRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => HomePage()),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
