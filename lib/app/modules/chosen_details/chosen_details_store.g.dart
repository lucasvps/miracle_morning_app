// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chosen_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ChosenDetailsStore on _ChosenDetailsStoreBase, Store {
  final _$totalDoneAtom = Atom(name: '_ChosenDetailsStoreBase.totalDone');

  @override
  int get totalDone {
    _$totalDoneAtom.reportRead();
    return super.totalDone;
  }

  @override
  set totalDone(int value) {
    _$totalDoneAtom.reportWrite(value, super.totalDone, () {
      super.totalDone = value;
    });
  }

  final _$totalLostAtom = Atom(name: '_ChosenDetailsStoreBase.totalLost');

  @override
  int get totalLost {
    _$totalLostAtom.reportRead();
    return super.totalLost;
  }

  @override
  set totalLost(int value) {
    _$totalLostAtom.reportWrite(value, super.totalLost, () {
      super.totalLost = value;
    });
  }

  final _$_ChosenDetailsStoreBaseActionController =
      ActionController(name: '_ChosenDetailsStoreBase');

  @override
  dynamic increaseTotalDone() {
    final _$actionInfo = _$_ChosenDetailsStoreBaseActionController.startAction(
        name: '_ChosenDetailsStoreBase.increaseTotalDone');
    try {
      return super.increaseTotalDone();
    } finally {
      _$_ChosenDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic increaseTotalLost() {
    final _$actionInfo = _$_ChosenDetailsStoreBaseActionController.startAction(
        name: '_ChosenDetailsStoreBase.increaseTotalLost');
    try {
      return super.increaseTotalLost();
    } finally {
      _$_ChosenDetailsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
totalDone: ${totalDone},
totalLost: ${totalLost}
    ''';
  }
}
