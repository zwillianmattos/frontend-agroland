// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$newsListAtom = Atom(name: '_HomeStoreBase.newsList');

  @override
  ObservableList<NewsModel> get newsList {
    _$newsListAtom.reportRead();
    return super.newsList;
  }

  @override
  set newsList(ObservableList<NewsModel> value) {
    _$newsListAtom.reportWrite(value, super.newsList, () {
      super.newsList = value;
    });
  }

  final _$loadNewsAsyncAction = AsyncAction('_HomeStoreBase.loadNews');

  @override
  Future loadNews() {
    return _$loadNewsAsyncAction.run(() => super.loadNews());
  }

  @override
  String toString() {
    return '''
newsList: ${newsList}
    ''';
  }
}
