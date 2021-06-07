// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ebook_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EbookPageStore on _EbookPageStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_EbookPageStoreBase.isLoading');

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

  final _$ebooksAtom = Atom(name: '_EbookPageStoreBase.ebooks');

  @override
  ObservableList<Ebook>? get ebooks {
    _$ebooksAtom.reportRead();
    return super.ebooks;
  }

  @override
  set ebooks(ObservableList<Ebook>? value) {
    _$ebooksAtom.reportWrite(value, super.ebooks, () {
      super.ebooks = value;
    });
  }

  final _$loadAsyncAction = AsyncAction('_EbookPageStoreBase.load');

  @override
  Future load() {
    return _$loadAsyncAction.run(() => super.load());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
ebooks: ${ebooks}
    ''';
  }
}
