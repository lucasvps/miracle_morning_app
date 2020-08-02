// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quote_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$QuoteStore on _QuoteStoreBase, Store {
  final _$quoteAtom = Atom(name: '_QuoteStoreBase.quote');

  @override
  String get quote {
    _$quoteAtom.reportRead();
    return super.quote;
  }

  @override
  set quote(String value) {
    _$quoteAtom.reportWrite(value, super.quote, () {
      super.quote = value;
    });
  }

  final _$authorAtom = Atom(name: '_QuoteStoreBase.author');

  @override
  String get author {
    _$authorAtom.reportRead();
    return super.author;
  }

  @override
  set author(String value) {
    _$authorAtom.reportWrite(value, super.author, () {
      super.author = value;
    });
  }

  final _$adManagerAtom = Atom(name: '_QuoteStoreBase.adManager');

  @override
  int get adManager {
    _$adManagerAtom.reportRead();
    return super.adManager;
  }

  @override
  set adManager(int value) {
    _$adManagerAtom.reportWrite(value, super.adManager, () {
      super.adManager = value;
    });
  }

  final _$_QuoteStoreBaseActionController =
      ActionController(name: '_QuoteStoreBase');

  @override
  dynamic setQuote(String value) {
    final _$actionInfo = _$_QuoteStoreBaseActionController.startAction(
        name: '_QuoteStoreBase.setQuote');
    try {
      return super.setQuote(value);
    } finally {
      _$_QuoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setAuthor(String value) {
    final _$actionInfo = _$_QuoteStoreBaseActionController.startAction(
        name: '_QuoteStoreBase.setAuthor');
    try {
      return super.setAuthor(value);
    } finally {
      _$_QuoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic increaseAdManager() {
    final _$actionInfo = _$_QuoteStoreBaseActionController.startAction(
        name: '_QuoteStoreBase.increaseAdManager');
    try {
      return super.increaseAdManager();
    } finally {
      _$_QuoteStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
quote: ${quote},
author: ${author},
adManager: ${adManager}
    ''';
  }
}
