import 'afirmations_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'afirmations_page.dart';

class AfirmationsModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AfirmationsController()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => AfirmationsPage()),
      ];

  static Inject get to => Inject<AfirmationsModule>.of();
}
