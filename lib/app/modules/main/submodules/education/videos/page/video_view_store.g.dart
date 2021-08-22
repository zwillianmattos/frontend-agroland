// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoViewStore on _VideoViewStoreBase, Store {
  final _$isloadedAtom = Atom(name: '_VideoViewStoreBase.isloaded');

  @override
  bool get isloaded {
    _$isloadedAtom.reportRead();
    return super.isloaded;
  }

  @override
  set isloaded(bool value) {
    _$isloadedAtom.reportWrite(value, super.isloaded, () {
      super.isloaded = value;
    });
  }

  final _$videoPlayerControllerAtom =
      Atom(name: '_VideoViewStoreBase.videoPlayerController');

  @override
  YoutubePlayerController? get videoPlayerController {
    _$videoPlayerControllerAtom.reportRead();
    return super.videoPlayerController;
  }

  @override
  set videoPlayerController(YoutubePlayerController? value) {
    _$videoPlayerControllerAtom.reportWrite(value, super.videoPlayerController,
        () {
      super.videoPlayerController = value;
    });
  }

  final _$isExpandedAtom = Atom(name: '_VideoViewStoreBase.isExpanded');

  @override
  bool get isExpanded {
    _$isExpandedAtom.reportRead();
    return super.isExpanded;
  }

  @override
  set isExpanded(bool value) {
    _$isExpandedAtom.reportWrite(value, super.isExpanded, () {
      super.isExpanded = value;
    });
  }

  final _$movieAtom = Atom(name: '_VideoViewStoreBase.movie');

  @override
  Movie? get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(Movie? value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  final _$_VideoViewStoreBaseActionController =
      ActionController(name: '_VideoViewStoreBase');

  @override
  dynamic changeExpanded() {
    final _$actionInfo = _$_VideoViewStoreBaseActionController.startAction(
        name: '_VideoViewStoreBase.changeExpanded');
    try {
      return super.changeExpanded();
    } finally {
      _$_VideoViewStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isloaded: ${isloaded},
videoPlayerController: ${videoPlayerController},
isExpanded: ${isExpanded},
movie: ${movie}
    ''';
  }
}
