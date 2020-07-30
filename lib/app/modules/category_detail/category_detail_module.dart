import 'category_detail_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'category_detail_page.dart';

class CategoryDetailModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => CategoryDetailController()),
        
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => CategoryDetailPage()),
      ];

  static Inject get to => Inject<CategoryDetailModule>.of();
}
