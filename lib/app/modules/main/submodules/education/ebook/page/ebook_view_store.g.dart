// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebook_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EbookViewStore on _EbookViewStoreBase, Store {
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

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
ebook: ${ebook}
    ''';
  }
}
