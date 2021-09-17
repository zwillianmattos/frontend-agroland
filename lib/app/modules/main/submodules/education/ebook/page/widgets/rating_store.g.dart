// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rating_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RatingStore on _RatingStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_RatingStoreBase.isLoading');

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

  final _$ebookAtom = Atom(name: '_RatingStoreBase.ebook');

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

  final _$ratingAtom = Atom(name: '_RatingStoreBase.rating');

  @override
  RatingModel? get rating {
    _$ratingAtom.reportRead();
    return super.rating;
  }

  @override
  set rating(RatingModel? value) {
    _$ratingAtom.reportWrite(value, super.rating, () {
      super.rating = value;
    });
  }

  final _$sendRateAsyncAction = AsyncAction('_RatingStoreBase.sendRate');

  @override
  Future sendRate() {
    return _$sendRateAsyncAction.run(() => super.sendRate());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
ebook: ${ebook},
rating: ${rating}
    ''';
  }
}
