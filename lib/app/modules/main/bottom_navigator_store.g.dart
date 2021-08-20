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

  final _$isMobileAtom = Atom(name: '_BottomNavigatorStoreBase.isMobile');

  @override
  bool get isMobile {
    _$isMobileAtom.reportRead();
    return super.isMobile;
  }

  @override
  set isMobile(bool value) {
    _$isMobileAtom.reportWrite(value, super.isMobile, () {
      super.isMobile = value;
    });
  }

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

  final _$_BottomNavigatorStoreBaseActionController =
      ActionController(name: '_BottomNavigatorStoreBase');

  @override
  dynamic checkScreenSize(dynamic context) {
    final _$actionInfo = _$_BottomNavigatorStoreBaseActionController
        .startAction(name: '_BottomNavigatorStoreBase.checkScreenSize');
    try {
      return super.checkScreenSize(context);
    } finally {
      _$_BottomNavigatorStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isMobile: ${isMobile},
currentIndex: ${currentIndex},
currentPage: ${currentPage}
    ''';
  }
}
