// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebook_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EbookViewStore on _EbookViewStoreBase, Store {
  Computed<dynamic>? _$getTotalRatingComputed;

  @override
  dynamic get getTotalRating => (_$getTotalRatingComputed ??= Computed<dynamic>(
          () => super.getTotalRating,
          name: '_EbookViewStoreBase.getTotalRating'))
      .value;

  final _$isLoadingAtom = Atom(name: '_EbookViewStoreBase.isLoading');

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

  final _$ebookAtom = Atom(name: '_EbookViewStoreBase.ebook');

  @override
  Ebook? get ebook {
    _$ebookAtom.reportRead();
    return super.ebook;
  }

  @override
  set ebook(Ebook? value) {
    _$ebookAtom.reportWrite(value, super.ebook, () {
      super.ebook = value;
    });
  }

  final _$ratingTotalAtom = Atom(name: '_EbookViewStoreBase.ratingTotal');

  @override
  double get ratingTotal {
    _$ratingTotalAtom.reportRead();
    return super.ratingTotal;
  }

  @override
  set ratingTotal(double value) {
    _$ratingTotalAtom.reportWrite(value, super.ratingTotal, () {
      super.ratingTotal = value;
    });
  }

  final _$loadEbookAsyncAction = AsyncAction('_EbookViewStoreBase.loadEbook');

  @override
  Future loadEbook({bool showLoad = true}) {
    return _$loadEbookAsyncAction
        .run(() => super.loadEbook(showLoad: showLoad));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
ebook: ${ebook},
ratingTotal: ${ratingTotal},
getTotalRating: ${getTotalRating}
    ''';
  }
}
