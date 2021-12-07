// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_service.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NotificationService on _NotificationServiceBase, Store {
  final _$requiresConsentAtom =
      Atom(name: '_NotificationServiceBase.requiresConsent');

  @override
  bool get requiresConsent {
    _$requiresConsentAtom.reportRead();
    return super.requiresConsent;
  }

  @override
  set requiresConsent(bool value) {
    _$requiresConsentAtom.reportWrite(value, super.requiresConsent, () {
      super.requiresConsent = value;
    });
  }

  final _$initPlatformStateAsyncAction =
      AsyncAction('_NotificationServiceBase.initPlatformState');

  @override
  Future<dynamic> initPlatformState() {
    return _$initPlatformStateAsyncAction.run(() => super.initPlatformState());
  }

  final _$_NotificationServiceBaseActionController =
      ActionController(name: '_NotificationServiceBase');

  @override
  dynamic setRequiresConsent(bool value) {
    final _$actionInfo = _$_NotificationServiceBaseActionController.startAction(
        name: '_NotificationServiceBase.setRequiresConsent');
    try {
      return super.setRequiresConsent(value);
    } finally {
      _$_NotificationServiceBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
requiresConsent: ${requiresConsent}
    ''';
  }
}
