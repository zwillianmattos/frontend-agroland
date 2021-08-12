// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_preferences_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserPreferencesStore on _UserPreferencesStoreBase, Store {
  final _$darkThemeAtom = Atom(name: '_UserPreferencesStoreBase.darkTheme');

  @override
  bool get darkTheme {
    _$darkThemeAtom.reportRead();
    return super.darkTheme;
  }

  @override
  set darkTheme(bool value) {
    _$darkThemeAtom.reportWrite(value, super.darkTheme, () {
      super.darkTheme = value;
    });
  }

  final _$_loadFromLocalStorageAsyncAction =
      AsyncAction('_UserPreferencesStoreBase._loadFromLocalStorage');

  @override
  Future<void> _loadFromLocalStorage() {
    return _$_loadFromLocalStorageAsyncAction
        .run(() => super._loadFromLocalStorage());
  }

  final _$_UserPreferencesStoreBaseActionController =
      ActionController(name: '_UserPreferencesStoreBase');

  @override
  dynamic darkMode() {
    final _$actionInfo = _$_UserPreferencesStoreBaseActionController
        .startAction(name: '_UserPreferencesStoreBase.darkMode');
    try {
      return super.darkMode();
    } finally {
      _$_UserPreferencesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
darkTheme: ${darkTheme}
    ''';
  }
}
