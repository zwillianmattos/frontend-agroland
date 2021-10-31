// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketplaceHomeStore on _MarketplaceHomeStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_MarketplaceHomeStoreBase.isLoading');

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

  final _$productsAtom = Atom(name: '_MarketplaceHomeStoreBase.products');

  @override
  ObservableList<ProductSell>? get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductSell>? value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  final _$categoriesAtom = Atom(name: '_MarketplaceHomeStoreBase.categories');

  @override
  ObservableList<ProductCategories>? get categories {
    _$categoriesAtom.reportRead();
    return super.categories;
  }

  @override
  set categories(ObservableList<ProductCategories>? value) {
    _$categoriesAtom.reportWrite(value, super.categories, () {
      super.categories = value;
    });
  }

  final _$indexCategoryAtom =
      Atom(name: '_MarketplaceHomeStoreBase.indexCategory');

  @override
  int get indexCategory {
    _$indexCategoryAtom.reportRead();
    return super.indexCategory;
  }

  @override
  set indexCategory(int value) {
    _$indexCategoryAtom.reportWrite(value, super.indexCategory, () {
      super.indexCategory = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_MarketplaceHomeStoreBase.load');

  @override
  Future load({dynamic query = "?size=20"}) {
    return _$loadAsyncAction.run(() => super.load(query: query));
  }

  final _$getCategoriesAsyncAction =
      AsyncAction('_MarketplaceHomeStoreBase.getCategories');

  @override
  Future getCategories() {
    return _$getCategoriesAsyncAction.run(() => super.getCategories());
  }

  final _$selectCategoryAsyncAction =
      AsyncAction('_MarketplaceHomeStoreBase.selectCategory');

  @override
  Future selectCategory(dynamic element) {
    return _$selectCategoryAsyncAction.run(() => super.selectCategory(element));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
products: ${products},
categories: ${categories},
indexCategory: ${indexCategory}
    ''';
  }
}
