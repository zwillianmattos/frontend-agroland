// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announces_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MarketplaceAnnouncesStore on _MarketplaceAnnouncesStoreBase, Store {
  final _$announcesAtom =
      Atom(name: '_MarketplaceAnnouncesStoreBase.announces');

  @override
  ObservableList<ProductSell>? get announces {
    _$announcesAtom.reportRead();
    return super.announces;
  }

  @override
  set announces(ObservableList<ProductSell>? value) {
    _$announcesAtom.reportWrite(value, super.announces, () {
      super.announces = value;
    });
  }

  final _$isLoadingAtom =
      Atom(name: '_MarketplaceAnnouncesStoreBase.isLoading');

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

  final _$loadAnnouncesAsyncAction =
      AsyncAction('_MarketplaceAnnouncesStoreBase.loadAnnounces');

  @override
  Future loadAnnounces() {
    return _$loadAnnouncesAsyncAction.run(() => super.loadAnnounces());
  }

  @override
  String toString() {
    return '''
announces: ${announces},
isLoading: ${isLoading}
    ''';
  }
}
