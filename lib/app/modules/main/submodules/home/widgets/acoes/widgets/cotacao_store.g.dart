// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cotacao_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CotacaoStore on _CotacaoStoreBase, Store {
  final _$cotacaoAtom = Atom(name: '_CotacaoStoreBase.cotacao');

  @override
  CotacaoModel? get cotacao {
    _$cotacaoAtom.reportRead();
    return super.cotacao;
  }

  @override
  set cotacao(CotacaoModel? value) {
    _$cotacaoAtom.reportWrite(value, super.cotacao, () {
      super.cotacao = value;
    });
  }

  final _$loadingAtom = Atom(name: '_CotacaoStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$slugSelectedAtom = Atom(name: '_CotacaoStoreBase.slugSelected');

  @override
  String get slugSelected {
    _$slugSelectedAtom.reportRead();
    return super.slugSelected;
  }

  @override
  set slugSelected(String value) {
    _$slugSelectedAtom.reportWrite(value, super.slugSelected, () {
      super.slugSelected = value;
    });
  }

  final _$loadCotacaoAsyncAction = AsyncAction('_CotacaoStoreBase.loadCotacao');

  @override
  Future loadCotacao() {
    return _$loadCotacaoAsyncAction.run(() => super.loadCotacao());
  }

  final _$selectCotacaoAsyncAction =
      AsyncAction('_CotacaoStoreBase.selectCotacao');

  @override
  Future selectCotacao(String slug) {
    return _$selectCotacaoAsyncAction.run(() => super.selectCotacao(slug));
  }

  @override
  String toString() {
    return '''
cotacao: ${cotacao},
loading: ${loading},
slugSelected: ${slugSelected}
    ''';
  }
}
