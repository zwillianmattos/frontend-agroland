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

  final _$loadThreadsAsyncAction =
      AsyncAction('ThreadStorePageBase.loadThreads');

  @override
  Future loadThreads({dynamic query = "?size=10"}) {
    return _$loadThreadsAsyncAction.run(() => super.loadThreads(query: query));
  }

  final _$sendCommentThreadAsyncAction =
      AsyncAction('ThreadStorePageBase.sendCommentThread');

  @override
  Future sendCommentThread({required String comment, required Thread thread}) {
    return _$sendCommentThreadAsyncAction
        .run(() => super.sendCommentThread(comment: comment, thread: thread));
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
threads: ${threads},
threadScrollController: ${threadScrollController},
commentIndex: ${commentIndex}
    ''';
  }
}
