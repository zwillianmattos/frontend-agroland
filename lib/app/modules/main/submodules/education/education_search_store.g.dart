// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_search_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EducationSearchStore on _EducationSearchStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_EducationSearchStoreBase.isLoading');

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

  final _$searchControllerAtom =
      Atom(name: '_EducationSearchStoreBase.searchController');

  @override
  TextEditingController get searchController {
    _$searchControllerAtom.reportRead();
    return super.searchController;
  }

  @override
  set searchController(TextEditingController value) {
    _$searchControllerAtom.reportWrite(value, super.searchController, () {
      super.searchController = value;
    });
  }

  final _$searchTextAtom = Atom(name: '_EducationSearchStoreBase.searchText');

  @override
  String get searchText {
    _$searchTextAtom.reportRead();
    return super.searchText;
  }

  @override
  set searchText(String value) {
    _$searchTextAtom.reportWrite(value, super.searchText, () {
      super.searchText = value;
    });
  }

  final _$searchResultsAtom =
      Atom(name: '_EducationSearchStoreBase.searchResults');

  @override
  ObservableList<Ebook> get searchResults {
    _$searchResultsAtom.reportRead();
    return super.searchResults;
  }

  @override
  set searchResults(ObservableList<Ebook> value) {
    _$searchResultsAtom.reportWrite(value, super.searchResults, () {
      super.searchResults = value;
    });
  }

  final _$searchAsyncAction = AsyncAction('_EducationSearchStoreBase.search');

  @override
  Future search() {
    return _$searchAsyncAction.run(() => super.search());
  }

  final _$_EducationSearchStoreBaseActionController =
      ActionController(name: '_EducationSearchStoreBase');

  @override
  dynamic clearSearch() {
    final _$actionInfo = _$_EducationSearchStoreBaseActionController
        .startAction(name: '_EducationSearchStoreBase.clearSearch');
    try {
      return super.clearSearch();
    } finally {
      _$_EducationSearchStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
searchController: ${searchController},
searchText: ${searchText},
searchResults: ${searchResults}
    ''';
  }
}
