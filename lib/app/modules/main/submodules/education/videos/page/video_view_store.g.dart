// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_view_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoViewStore on _VideoViewStoreBase, Store {
  final _$isLoadingAtom = Atom(name: '_VideoViewStoreBase.isLoading');

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

  final _$movieAtom = Atom(name: '_VideoViewStoreBase.movie');

  @override
  Movie get movie {
    _$movieAtom.reportRead();
    return super.movie;
  }

  @override
  set movie(Movie value) {
    _$movieAtom.reportWrite(value, super.movie, () {
      super.movie = value;
    });
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
videoPlayerController: ${videoPlayerController},
movie: ${movie}
    ''';
  }
}
