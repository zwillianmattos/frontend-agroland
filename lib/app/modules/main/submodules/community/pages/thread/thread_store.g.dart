// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThreadStorePage on ThreadStorePageBase, Store {
  final _$isLoadingAtom = Atom(name: 'ThreadStorePageBase.isLoading');

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

  final _$currentPageAtom = Atom(name: 'ThreadStorePageBase.currentPage');

  @override
  int get currentPage {
    _$currentPageAtom.reportRead();
    return super.currentPage;
  }

  @override
  set currentPage(int value) {
    _$currentPageAtom.reportWrite(value, super.currentPage, () {
      super.currentPage = value;
    });
  }

  final _$totalPageAtom = Atom(name: 'ThreadStorePageBase.totalPage');

  @override
  int get totalPage {
    _$totalPageAtom.reportRead();
    return super.totalPage;
  }

  @override
  set totalPage(int value) {
    _$totalPageAtom.reportWrite(value, super.totalPage, () {
      super.totalPage = value;
    });
  }

  final _$threadsAtom = Atom(name: 'ThreadStorePageBase.threads');

  @override
  ObservableList<Thread> get threads {
    _$threadsAtom.reportRead();
    return super.threads;
  }

  @override
  set threads(ObservableList<Thread> value) {
    _$threadsAtom.reportWrite(value, super.threads, () {
      super.threads = value;
    });
  }

  final _$threadScrollControllerAtom =
      Atom(name: 'ThreadStorePageBase.threadScrollController');

  @override
  ScrollController? get threadScrollController {
    _$threadScrollControllerAtom.reportRead();
    return super.threadScrollController;
  }

  @override
  set threadScrollController(ScrollController? value) {
    _$threadScrollControllerAtom
        .reportWrite(value, super.threadScrollController, () {
      super.threadScrollController = value;
    });
  }

  final _$paginateModelAtom = Atom(name: 'ThreadStorePageBase.paginateModel');

  @override
  PaginateModel get paginateModel {
    _$paginateModelAtom.reportRead();
    return super.paginateModel;
  }

  @override
  set paginateModel(PaginateModel value) {
    _$paginateModelAtom.reportWrite(value, super.paginateModel, () {
      super.paginateModel = value;
    });
  }

  final _$commentIndexAtom = Atom(name: 'ThreadStorePageBase.commentIndex');

  @override
  int? get commentIndex {
    _$commentIndexAtom.reportRead();
    return super.commentIndex;
  }

  @override
  set commentIndex(int? value) {
    _$commentIndexAtom.reportWrite(value, super.commentIndex, () {
      super.commentIndex = value;
    });
  }

  final _$refreshAsyncAction = AsyncAction('ThreadStorePageBase.refresh');

  @override
  Future refresh() {
    return _$refreshAsyncAction.run(() => super.refresh());
  }

  final _$loadThreadsAsyncAction =
      AsyncAction('ThreadStorePageBase.loadThreads');

  @override
  Future loadThreads({dynamic query = "?size=100"}) {
    return _$loadThreadsAsyncAction.run(() => super.loadThreads(query: query));
  }

  final _$sendCommentThreadAsyncAction =
      AsyncAction('ThreadStorePageBase.sendCommentThread');

  @override
  Future sendCommentThread({required String comment, required Thread thread}) {
    return _$sendCommentThreadAsyncAction
        .run(() => super.sendCommentThread(comment: comment, thread: thread));
  }

  final _$likeAsyncAction = AsyncAction('ThreadStorePageBase.like');

  @override
  Future<void> like({required Thread thread}) {
    return _$likeAsyncAction.run(() => super.like(thread: thread));
  }

  final _$removeThreadAsyncAction =
      AsyncAction('ThreadStorePageBase.removeThread');

  @override
  Future removeThread(Thread thread) {
    return _$removeThreadAsyncAction.run(() => super.removeThread(thread));
  }

  final _$ThreadStorePageBaseActionController =
      ActionController(name: 'ThreadStorePageBase');

  @override
  void _scrollListener() {
    final _$actionInfo = _$ThreadStorePageBaseActionController.startAction(
        name: 'ThreadStorePageBase._scrollListener');
    try {
      return super._scrollListener();
    } finally {
      _$ThreadStorePageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic startCommentThread(dynamic index) {
    final _$actionInfo = _$ThreadStorePageBaseActionController.startAction(
        name: 'ThreadStorePageBase.startCommentThread');
    try {
      return super.startCommentThread(index);
    } finally {
      _$ThreadStorePageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
currentPage: ${currentPage},
totalPage: ${totalPage},
threads: ${threads},
threadScrollController: ${threadScrollController},
paginateModel: ${paginateModel},
commentIndex: ${commentIndex}
    ''';
  }
}
