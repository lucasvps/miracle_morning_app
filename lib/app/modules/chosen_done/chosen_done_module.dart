import 'package:miracle_morning_app/app/core/repositories/category_repository.dart';
import 'package:miracle_morning_app/app/modules/chosen_done/chosen_done_store.dart';

import 'chosen_done_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'chosen_done_page.dart';

class ChosenDoneModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChosenDoneController(i.get())),
        Bind((i) => ChosenDoneStore(i.get())),
        Bind((i) => CategoryRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ChosenDonePage()),
      ];

  static Inject get to => Inject<ChosenDoneModule>.of();
}
