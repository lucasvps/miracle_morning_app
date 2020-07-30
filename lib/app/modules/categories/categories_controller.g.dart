// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CategoriesController on _CategoriesControllerBase, Store {
  final _$categoriesAtom = Atom(name: '_CategoriesControllerBase.categories');

  @override
  ObservableFuture<List<CategoryModel>> get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableFuture<List<CategoryModel>> value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  @override
  String toString() {
    return '''
categories: ${categories}
    ''';
  }
}
