

import 'package:flutter_modular/flutter_modular.dart';
import 'package:miracle_morning_app/app/core/interfaces/auth_repository_interface.dart';
import 'package:miracle_morning_app/app/core/interfaces/shared_local_storage_interface.dart';
import 'package:miracle_morning_app/app/core/repositories/auth_repository.dart';
import 'package:miracle_morning_app/app/core/services/shared_local_storage_service.dart';

import 'login_controller.dart';
import 'login_page.dart';
import 'login_store.dart';

class LoginModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => LoginController(i.get<LoginStore>())),
        Bind((i) => LoginStore(i.get<IAuthRepository>())),
        Bind<IAuthRepository>((i) => AuthRepository(i.get())),
        Bind<ISharedLocalStorage>((i) => SharedLocalStorageService())
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => LoginPage()),
      ];

  static Inject get to => Inject<LoginModule>.of();
}
