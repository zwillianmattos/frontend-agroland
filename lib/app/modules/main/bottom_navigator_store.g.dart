// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigator_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$BottomNavigatorStore on _BottomNavigatorStoreBase, Store {
  Computed<dynamic>? _$currentPageComputed;

  @override
  dynamic get currentPage =>
      (_$currentPageComputed ??= Computed<dynamic>(() => super.currentPage,
              name: '_BottomNavigatorStoreBase.currentPage'))
          .value;

  final _$currentIndexAtom =
      Atom(name: '_BottomNavigatorStoreBase.currentIndex');

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(value, super.currentIndex, () {
      super.currentIndex = value;
    });
  }

  final _$changePageAsyncAction =
      AsyncAction('_BottomNavigatorStoreBase.changePage');

  @override
  Future changePage(dynamic index, {dynamic navigate = true}) {
    return _$changePageAsyncAction
        .run(() => super.changePage(index, navigate: navigate));
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex},
currentPage: ${currentPage}
    ''';
  }
}
