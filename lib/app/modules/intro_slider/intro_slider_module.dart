import 'intro_slider_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'intro_slider_page.dart';

class IntroSliderModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => IntroSliderController()),
      ];

  @override
  List<Router> get routers => [
        Router('/:width/:height',
            child: (_, args) => IntroSliderPage(
                  width: args.params['width'],
                  height: args.params['height'],
                )),
      ];

  static Inject get to => Inject<IntroSliderModule>.of();
}
