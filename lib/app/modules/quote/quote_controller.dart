import 'package:miracle_morning_app/app/modules/quote/quote_store.dart';
import 'package:mobx/mobx.dart';


part 'quote_controller.g.dart';

class QuoteController = _QuoteControllerBase with _$QuoteController;

abstract class _QuoteControllerBase with Store {
  final QuoteStore store;


  _QuoteControllerBase(this.store);
}
