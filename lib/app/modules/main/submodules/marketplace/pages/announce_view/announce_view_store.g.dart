// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announce_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketplaceAnnounceViewStore
    on _MarketplaceAnnounceViewStoreBase, Store {
  final _$isLoadingAtom =
      Atom(name: '_MarketplaceAnnounceViewStoreBase.isLoading');

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

  final _$productSellAtom =
      Atom(name: '_MarketplaceAnnounceViewStoreBase.productSell');

  @override
  ProductSell get productSell {
    _$productSellAtom.reportRead();
    return super.productSell;
  }

  @override
  set productSell(ProductSell value) {
    _$productSellAtom.reportWrite(value, super.productSell, () {
      super.productSell = value;
    });
  }

  final _$addAsyncAction = AsyncAction('_MarketplaceAnnounceViewStoreBase.add');

  @override
  Future add() {
    return _$addAsyncAction.run(() => super.add());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
productSell: ${productSell}
    ''';
  }
}
