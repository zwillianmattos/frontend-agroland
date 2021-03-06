// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marketplace_view_account_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketplaceViewAccoutStore on _MarketplaceViewAccoutStoreBase, Store {
  final _$isLoadingAtom =
      Atom(name: '_MarketplaceViewAccoutStoreBase.isLoading');

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

  final _$productsAtom = Atom(name: '_MarketplaceViewAccoutStoreBase.products');

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

  final _$loadAsyncAction = AsyncAction('_MarketplaceViewAccoutStoreBase.load');

  @override
  Future load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
products: ${products}
    ''';
  }
}
