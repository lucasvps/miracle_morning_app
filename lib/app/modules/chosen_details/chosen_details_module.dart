import 'package:miracle_morning_app/app/core/repositories/date_status_repository.dart';
import 'package:miracle_morning_app/app/modules/chosen_details/chosen_details_store.dart';

import 'chosen_details_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'chosen_details_page.dart';

class ChosenDetailsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChosenDetailsController(i.get())),
        Bind((i) => ChosenDetailsStore(i.get())),
        Bind((i) => DateStatusRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => ChosenDetailsPage()),
      ];

  static Inject get to => Inject<ChosenDetailsModule>.of();
}
