import 'package:miracle_morning_app/app/core/repositories/category_repository.dart';
import 'package:miracle_morning_app/app/core/repositories/date_status_repository.dart';
import 'package:miracle_morning_app/app/modules/category_chosen/category_chosen_store.dart';
import 'package:miracle_morning_app/app/modules/chosen_details/chosen_details_controller.dart';
import 'package:miracle_morning_app/app/modules/chosen_details/chosen_details_store.dart';

import 'category_chosen_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'category_chosen_page.dart';

class CategoryChosenModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CategoryChosenController(i.get())),
        Bind((i) => CategoryChosenStore(i.get(), i.get())),
        Bind((i) => CategoryRepository()),
        Bind((i) => DateStatusRepository()),
        Bind((i) => DateStatusRepository()),
        Bind((i) => DateStatusRepository()),
        Bind((i) => DateStatusRepository()),
        Bind((i) => ChosenDetailsController(i.get())),
        Bind((i) => ChosenDetailsStore(i.get())),
        Bind((i) => DateStatusRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => CategoryChosenPage()),
      ];

  static Inject get to => Inject<CategoryChosenModule>.of();
}
