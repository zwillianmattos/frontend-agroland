// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthStore on AuthStoreBase, Store {
  final _$isSignUpAtom = Atom(name: 'AuthStoreBase.isSignUp');

  @override
  bool get isSignUp {
    _$isSignUpAtom.reportRead();
    return super.isSignUp;
  }

  @override
  set isSignUp(bool value) {
    _$isSignUpAtom.reportWrite(value, super.isSignUp, () {
      super.isSignUp = value;
    });
  }

  final _$isSignInAtom = Atom(name: 'AuthStoreBase.isSignIn');

  @override
  bool get isSignIn {
    _$isSignInAtom.reportRead();
    return super.isSignIn;
  }

  @override
  set isSignIn(bool value) {
    _$isSignInAtom.reportWrite(value, super.isSignIn, () {
      super.isSignIn = value;
    });
  }

  @override
  String toString() {
    return '''
isSignUp: ${isSignUp},
isSignIn: ${isSignIn}
    ''';
  }
}
