// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EducationStore on _EducationStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_EducationStoreBase.isLoading');

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

  final _$ebooksAtom = Atom(name: '_EducationStoreBase.ebooks');

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

  final _$loadAsyncAction = AsyncAction('_EducationStoreBase.load');

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
