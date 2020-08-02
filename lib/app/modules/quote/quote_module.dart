import 'package:miracle_morning_app/app/core/repositories/quote_repository.dart';
import 'package:miracle_morning_app/app/modules/quote/quote_store.dart';

import 'quote_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'quote_page.dart';

class QuoteModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => QuoteController(i.get())),
        Bind((i) => QuoteStore(i.get())),
        Bind((i) => QuoteRepository()),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => QuotePage()),
      ];

  static Inject get to => Inject<QuoteModule>.of();
}
