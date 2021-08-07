// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'culture_detail_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CultureDetailViewStore on _CultureDetailViewStoreBase, Store {
  final _$culturesCategoriesRelsAtom =
      Atom(name: '_CultureDetailViewStoreBase.culturesCategoriesRels');

  @override
  CulturesCategoriesRels? get culturesCategoriesRels {
    _$culturesCategoriesRelsAtom.reportRead();
    return super.culturesCategoriesRels;
  }

  @override
  set culturesCategoriesRels(CulturesCategoriesRels? value) {
    _$culturesCategoriesRelsAtom
        .reportWrite(value, super.culturesCategoriesRels, () {
      super.culturesCategoriesRels = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_CultureDetailViewStoreBase.isLoading');

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

  final _$contentAtom = Atom(name: '_CultureDetailViewStoreBase.content');

  @override
  CultureContent? get content {
    _$contentAtom.reportRead();
    return super.content;
  }

  @override
  set content(CultureContent? value) {
    _$contentAtom.reportWrite(value, super.content, () {
      super.content = value;
    });
  }

  final _$loadCultureDetailAsyncAction =
      AsyncAction('_CultureDetailViewStoreBase.loadCultureDetail');

  @override
  Future loadCultureDetail() {
    return _$loadCultureDetailAsyncAction.run(() => super.loadCultureDetail());
  }

  @override
  String toString() {
    return '''
culturesCategoriesRels: ${culturesCategoriesRels},
isLoading: ${isLoading},
content: ${content}
    ''';
  }
}
