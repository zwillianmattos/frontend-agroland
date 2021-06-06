// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThreadViewStorePage on ThreadViewStorePageBase, Store {
  final _$isLoadingAtom = Atom(name: 'ThreadViewStorePageBase.isLoading');

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

  final _$threadAtom = Atom(name: 'ThreadViewStorePageBase.thread');

  @override
  Thread? get thread {
    _$threadAtom.reportRead();
    return super.thread;
  }

  @override
  set thread(Thread? value) {
    _$threadAtom.reportWrite(value, super.thread, () {
      super.thread = value;
    });
  }

  final _$commentAtom = Atom(name: 'ThreadViewStorePageBase.comment');

  @override
  bool get comment {
    _$commentAtom.reportRead();
    return super.comment;
  }

  @override
  set comment(bool value) {
    _$commentAtom.reportWrite(value, super.comment, () {
      super.comment = value;
    });
  }

  final _$commentControllerAtom =
      Atom(name: 'ThreadViewStorePageBase.commentController');

  @override
  QuillController get commentController {
    _$commentControllerAtom.reportRead();
    return super.commentController;
  }

  @override
  set commentController(QuillController value) {
    _$commentControllerAtom.reportWrite(value, super.commentController, () {
      super.commentController = value;
    });
  }

  final _$_loadThreadDetailAsyncAction =
      AsyncAction('ThreadViewStorePageBase._loadThreadDetail');

  @override
  Future _loadThreadDetail() {
    return _$_loadThreadDetailAsyncAction.run(() => super._loadThreadDetail());
  }

  final _$sendCommentAsyncAction =
      AsyncAction('ThreadViewStorePageBase.sendComment');

  @override
  Future sendComment({required String comment, required Thread thread}) {
    return _$sendCommentAsyncAction
        .run(() => super.sendComment(comment: comment, thread: thread));
  }

  final _$ThreadViewStorePageBaseActionController =
      ActionController(name: 'ThreadViewStorePageBase');

  @override
  dynamic startComment() {
    final _$actionInfo = _$ThreadViewStorePageBaseActionController.startAction(
        name: 'ThreadViewStorePageBase.startComment');
    try {
      return super.startComment();
    } finally {
      _$ThreadViewStorePageBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
thread: ${thread},
comment: ${comment},
commentController: ${commentController}
    ''';
  }
}
