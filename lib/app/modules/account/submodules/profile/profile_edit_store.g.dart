// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_edit_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileEditStore on _ProfileEditStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_ProfileEditStoreBase.isLoading');

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

  final _$accountAtom = Atom(name: '_ProfileEditStoreBase.account');

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

  final _$userPhotoUrlAtom = Atom(name: '_ProfileEditStoreBase.userPhotoUrl');

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

  final _$formKeyAtom = Atom(name: '_ProfileEditStoreBase.formKey');

  @override
  GlobalKey<FormState> get formKey {
    _$formKeyAtom.reportRead();
    return super.formKey;
  }

  @override
  set formKey(GlobalKey<FormState> value) {
    _$formKeyAtom.reportWrite(value, super.formKey, () {
      super.formKey = value;
    });
  }

  final _$uploadPhotoAsyncAction =
      AsyncAction('_ProfileEditStoreBase.uploadPhoto');

  @override
  Future uploadPhoto() {
    return _$uploadPhotoAsyncAction.run(() => super.uploadPhoto());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
account: ${account},
userPhotoUrl: ${userPhotoUrl},
formKey: ${formKey}
    ''';
  }
}
