// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cultures_list_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CulturesListStore on _CulturesListStoreBase, Store {
  final _$culturesAtom = Atom(name: '_CulturesListStoreBase.cultures');

  @override
  ObservableList<Culture>? get cultures {
    _$culturesAtom.reportRead();
    return super.cultures;
  }

  @override
  set cultures(ObservableList<Culture>? value) {
    _$culturesAtom.reportWrite(value, super.cultures, () {
      super.cultures = value;
    });
  }

  final _$loadCulturesAsyncAction =
      AsyncAction('_CulturesListStoreBase.loadCultures');

  @override
  Future loadCultures() {
    return _$loadCulturesAsyncAction.run(() => super.loadCultures());
  }

  @override
  String toString() {
    return '''
cultures: ${cultures}
    ''';
  }
}
