import 'package:miracle_morning_app/app/modules/categories/categories_module.dart';
import 'package:miracle_morning_app/app/modules/category_detail/category_detail_controller.dart';
import 'package:miracle_morning_app/app/modules/category_detail/category_detail_module.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:miracle_morning_app/app/app_widget.dart';
import 'package:miracle_morning_app/app/modules/home/home_module.dart';

import 'core/repositories/category_repository.dart';
import 'core/repositories/date_status_repository.dart';
import 'modules/category_chosen/category_chosen_store.dart';
import 'modules/login/login_module.dart';
import 'modules/splash/splash_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AppController(i.get())),
        Bind((i) => CategoryDetailController()),
        Bind((i) => CategoryDetailController()),
        Bind((i) => CategoryChosenStore(i.get(), i.get())),
        Bind((i) => CategoryRepository()),
        Bind((i) => DateStatusRepository()),
      ];

  @override
  List<Router> get routers => [
        Router('/', module: SplashModule()),
        Router('/login', module: LoginModule()),
        Router('/home', module: HomeModule()),
        Router('/categories', module: CategoriesModule()),
        Router('/categoryDetail', module: CategoryDetailModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
