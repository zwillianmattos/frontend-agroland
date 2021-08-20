// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileStore on _ProfileStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_ProfileStoreBase.isLoading');

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

  final _$accountAtom = Atom(name: '_ProfileStoreBase.account');

  @override
  User? get account {
    _$accountAtom.reportRead();
    return super.account;
  }

  @override
  set account(User? value) {
    _$accountAtom.reportWrite(value, super.account, () {
      super.account = value;
    });
  }

  final _$userPhotoUrlAtom = Atom(name: '_ProfileStoreBase.userPhotoUrl');

  @override
  String? get userPhotoUrl {
    _$userPhotoUrlAtom.reportRead();
    return super.userPhotoUrl;
  }

  @override
  set userPhotoUrl(String? value) {
    _$userPhotoUrlAtom.reportWrite(value, super.userPhotoUrl, () {
      super.userPhotoUrl = value;
    });
  }

  final _$_ProfileStoreBaseActionController =
      ActionController(name: '_ProfileStoreBase');

  @override
  dynamic refresh() {
    final _$actionInfo = _$_ProfileStoreBaseActionController.startAction(
        name: '_ProfileStoreBase.refresh');
    try {
      return super.refresh();
    } finally {
      _$_ProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
account: ${account},
userPhotoUrl: ${userPhotoUrl}
    ''';
  }
}
