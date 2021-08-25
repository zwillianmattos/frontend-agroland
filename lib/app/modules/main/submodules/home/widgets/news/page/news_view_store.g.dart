// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsViewStore on _NewsViewStoreBase, Store {
  final _$favoriteAtom = Atom(name: '_NewsViewStoreBase.favorite');

  @override
  bool get favorite {
    _$favoriteAtom.reportRead();
    return super.favorite;
  }

  @override
  set favorite(bool value) {
    _$favoriteAtom.reportWrite(value, super.favorite, () {
      super.favorite = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_NewsViewStoreBase.isLoading');

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

  final _$newsAtom = Atom(name: '_NewsViewStoreBase.news');

  @override
  NewsModel? get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(NewsModel? value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_NewsViewStoreBase.load');

  @override
  Future load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  final _$saveNoticeAsyncAction = AsyncAction('_NewsViewStoreBase.saveNotice');

  @override
  Future saveNotice() {
    return _$saveNoticeAsyncAction.run(() => super.saveNotice());
  }

  @override
  String toString() {
    return '''
favorite: ${favorite},
isLoading: ${isLoading},
news: ${news}
    ''';
  }
}
