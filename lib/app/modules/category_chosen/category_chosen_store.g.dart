// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_chosen_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoryChosenStore on _CategoryChosenStoreBase, Store {
  final _$idDoneTodayAtom = Atom(name: '_CategoryChosenStoreBase.idDoneToday');

  @override
  List<dynamic> get idDoneToday {
    _$idDoneTodayAtom.reportRead();
    return super.idDoneToday;
  }

  @override
  set idDoneToday(List<dynamic> value) {
    _$idDoneTodayAtom.reportWrite(value, super.idDoneToday, () {
      super.idDoneToday = value;
    });
  }

  final _$_CategoryChosenStoreBaseActionController =
      ActionController(name: '_CategoryChosenStoreBase');

  @override
  dynamic markAsDone(int id, String date, dynamic status) {
    final _$actionInfo = _$_CategoryChosenStoreBaseActionController.startAction(
        name: '_CategoryChosenStoreBase.markAsDone');
    try {
      return super.markAsDone(id, date, status);
    } finally {
      _$_CategoryChosenStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idDoneToday: ${idDoneToday}
    ''';
  }
}
