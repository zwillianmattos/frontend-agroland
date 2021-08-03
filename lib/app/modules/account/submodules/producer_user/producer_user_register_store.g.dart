// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producer_user_register_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProducerUserRegisterStore on _ProducerUserRegisterStoreBase, Store {
  final _$isLoadingAtom =
      Atom(name: '_ProducerUserRegisterStoreBase.isLoading');

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

  final _$producerUserAtom =
      Atom(name: '_ProducerUserRegisterStoreBase.producerUser');

  @override
  ProducerUser get producerUser {
    _$producerUserAtom.reportRead();
    return super.producerUser;
  }

  @override
  set producerUser(ProducerUser value) {
    _$producerUserAtom.reportWrite(value, super.producerUser, () {
      super.producerUser = value;
    });
  }

  final _$producerUserAddressAtom =
      Atom(name: '_ProducerUserRegisterStoreBase.producerUserAddress');

  @override
  ProducerUserAddress get producerUserAddress {
    _$producerUserAddressAtom.reportRead();
    return super.producerUserAddress;
  }

  @override
  set producerUserAddress(ProducerUserAddress value) {
    _$producerUserAddressAtom.reportWrite(value, super.producerUserAddress, () {
      super.producerUserAddress = value;
    });
  }

  final _$registerAsyncAction =
      AsyncAction('_ProducerUserRegisterStoreBase.register');

  @override
  Future register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
producerUser: ${producerUser},
producerUserAddress: ${producerUserAddress}
    ''';
  }
}
