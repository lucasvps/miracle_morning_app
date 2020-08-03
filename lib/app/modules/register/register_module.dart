import 'package:miracle_morning_app/app/core/interfaces/auth_repository_interface.dart';
import 'package:miracle_morning_app/app/core/interfaces/local_notification_interface.dart';
import 'package:miracle_morning_app/app/core/interfaces/shared_local_storage_interface.dart';
import 'package:miracle_morning_app/app/core/repositories/auth_repository.dart';
import 'package:miracle_morning_app/app/core/services/local_notification_service.dart';
import 'package:miracle_morning_app/app/core/services/shared_local_storage_service.dart';
import 'package:miracle_morning_app/app/core/stores/auth_store.dart';
import 'package:miracle_morning_app/app/modules/register/register_store.dart';

import 'register_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'register_page.dart';

class RegisterModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => RegisterController(i.get(), i.get())),
        Bind((i) => RegisterStore(i.get())),
        Bind<IAuthRepository>((i) => AuthRepository(i.get())),
        Bind<ISharedLocalStorage>((i) => SharedLocalStorageService()),
        Bind<ILocalNotification>((i) => LocalNotificationService()),
        Bind((i) => AuthStore(i.get())),
      ];

  @override
  List<Router> get routers => [
        Router(Modular.initialRoute, child: (_, args) => RegisterPage()),
      ];

  static Inject get to => Inject<RegisterModule>.of();
}
