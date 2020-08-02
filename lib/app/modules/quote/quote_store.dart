import 'package:miracle_morning_app/app/core/repositories/quote_repository.dart';
import 'package:mobx/mobx.dart';

part 'quote_store.g.dart';

class QuoteStore = _QuoteStoreBase with _$QuoteStore;

abstract class _QuoteStoreBase with Store {
  final QuoteRepository repository;

  _QuoteStoreBase(this.repository);

  @observable
  String quote;

  @action
  setQuote(String value) => quote = value;

  @observable
  String author;

  @action
  setAuthor(String value) => author = value;

  @observable
  int adManager = 1;

  @action
  increaseAdManager() => adManager +=1;

}