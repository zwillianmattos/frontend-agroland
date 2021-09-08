// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_view_more_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsViewMoreStore on _NewsViewMoreStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_NewsViewMoreStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$listNewsSavedAtom =
      Atom(name: '_NewsViewMoreStoreBase.listNewsSaved');

  @override
  ObservableList<dynamic> get listNewsSaved {
    _$listNewsSavedAtom.reportRead();
    return super.listNewsSaved;
  }

  @override
  set listNewsSaved(ObservableList<dynamic> value) {
    _$listNewsSavedAtom.reportWrite(value, super.listNewsSaved, () {
      super.listNewsSaved = value;
    });
  }

  final _$loadSavedNewsAsyncAction =
      AsyncAction('_NewsViewMoreStoreBase.loadSavedNews');

  @override
  Future loadSavedNews() {
    return _$loadSavedNewsAsyncAction.run(() => super.loadSavedNews());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
listNewsSaved: ${listNewsSaved}
    ''';
  }
}
