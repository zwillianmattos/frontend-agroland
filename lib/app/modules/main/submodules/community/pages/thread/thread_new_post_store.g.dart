// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'thread_new_post_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ThreadNewPostStore on ThreadNewPostStoreBase, Store {
  final _$onImagePickCallbackAsyncAction =
      AsyncAction('ThreadNewPostStoreBase.onImagePickCallback');

  @override
  Future<String> onImagePickCallback(IO.File file) {
    return _$onImagePickCallbackAsyncAction
        .run(() => super.onImagePickCallback(file));
  }

  final _$onVideoPickCallbackAsyncAction =
      AsyncAction('ThreadNewPostStoreBase.onVideoPickCallback');

  @override
  Future<String> onVideoPickCallback(IO.File file) {
    return _$onVideoPickCallbackAsyncAction
        .run(() => super.onVideoPickCallback(file));
  }

  final _$loadFromAssetsAsyncAction =
      AsyncAction('ThreadNewPostStoreBase.loadFromAssets');

  @override
  Future<void> loadFromAssets() {
    return _$loadFromAssetsAsyncAction.run(() => super.loadFromAssets());
  }

  final _$openFileSystemPickerForDesktopAsyncAction =
      AsyncAction('ThreadNewPostStoreBase.openFileSystemPickerForDesktop');

  @override
  Future<String?> openFileSystemPickerForDesktop(BuildContext context) {
    return _$openFileSystemPickerForDesktopAsyncAction
        .run(() => super.openFileSystemPickerForDesktop(context));
  }

  final _$webImagePickImplAsyncAction =
      AsyncAction('ThreadNewPostStoreBase.webImagePickImpl');

  @override
  Future<String?> webImagePickImpl(OnImagePickCallback onImagePickCallback) {
    return _$webImagePickImplAsyncAction
        .run(() => super.webImagePickImpl(onImagePickCallback));
  }

  final _$sendCommentAsyncAction =
      AsyncAction('ThreadNewPostStoreBase.sendComment');

  @override
  Future<void> sendComment() {
    return _$sendCommentAsyncAction.run(() => super.sendComment());
  }

  final _$ThreadNewPostStoreBaseActionController =
      ActionController(name: 'ThreadNewPostStoreBase');

  @override
  bool isDesktop() {
    final _$actionInfo = _$ThreadNewPostStoreBaseActionController.startAction(
        name: 'ThreadNewPostStoreBase.isDesktop');
    try {
      return super.isDesktop();
    } finally {
      _$ThreadNewPostStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
