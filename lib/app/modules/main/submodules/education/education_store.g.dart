// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'education_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EducationStore on _EducationStoreBase, Store {
  final _$ebooksControllerAtom =
      Atom(name: '_EducationStoreBase.ebooksController');

  @override
  ScrollController? get ebooksController {
    _$ebooksControllerAtom.reportRead();
    return super.ebooksController;
  }

  @override
  set ebooksController(ScrollController? value) {
    _$ebooksControllerAtom.reportWrite(value, super.ebooksController, () {
      super.ebooksController = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_EducationStoreBase.isLoading');

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

  final _$ebooksAtom = Atom(name: '_EducationStoreBase.ebooks');

  @override
  ObservableList<Ebook> get ebooks {
    _$ebooksAtom.reportRead();
    return super.ebooks;
  }

  @override
  set ebooks(ObservableList<Ebook> value) {
    _$ebooksAtom.reportWrite(value, super.ebooks, () {
      super.ebooks = value;
    });
  }

  final _$ebooksListAtom = Atom(name: '_EducationStoreBase.ebooksList');

  @override
  ObservableList<Ebook> get ebooksList {
    _$ebooksListAtom.reportRead();
    return super.ebooksList;
  }

  @override
  set ebooksList(ObservableList<Ebook> value) {
    _$ebooksListAtom.reportWrite(value, super.ebooksList, () {
      super.ebooksList = value;
    });
  }

  final _$ebookBannersAtom = Atom(name: '_EducationStoreBase.ebookBanners');

  @override
  ObservableList<Ebook> get ebookBanners {
    _$ebookBannersAtom.reportRead();
    return super.ebookBanners;
  }

  @override
  set ebookBanners(ObservableList<Ebook> value) {
    _$ebookBannersAtom.reportWrite(value, super.ebookBanners, () {
      super.ebookBanners = value;
    });
  }

  final _$videosListAtom = Atom(name: '_EducationStoreBase.videosList');

  @override
  ObservableList<String> get videosList {
    _$videosListAtom.reportRead();
    return super.videosList;
  }

  @override
  set videosList(ObservableList<String> value) {
    _$videosListAtom.reportWrite(value, super.videosList, () {
      super.videosList = value;
    });
  }

  final _$loadBannersAsyncAction =
      AsyncAction('_EducationStoreBase.loadBanners');

  @override
  Future loadBanners() {
    return _$loadBannersAsyncAction.run(() => super.loadBanners());
  }

  final _$loadPageAsyncAction = AsyncAction('_EducationStoreBase.loadPage');

  @override
  Future loadPage({dynamic query = "?size=10"}) {
    return _$loadPageAsyncAction.run(() => super.loadPage(query: query));
  }

  final _$loadAsyncAction = AsyncAction('_EducationStoreBase.load');

  @override
  Future load({dynamic query = "?size=10"}) {
    return _$loadAsyncAction.run(() => super.load(query: query));
  }

  final _$_EducationStoreBaseActionController =
      ActionController(name: '_EducationStoreBase');

  @override
  void _scrollListener() {
    final _$actionInfo = _$_EducationStoreBaseActionController.startAction(
        name: '_EducationStoreBase._scrollListener');
    try {
      return super._scrollListener();
    } finally {
      _$_EducationStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
ebooksController: ${ebooksController},
isLoading: ${isLoading},
ebooks: ${ebooks},
ebooksList: ${ebooksList},
ebookBanners: ${ebookBanners},
videosList: ${videosList}
    ''';
  }
}
