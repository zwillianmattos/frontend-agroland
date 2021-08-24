// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_view_playlist_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$VideoViewPlaylistStore on _VideoViewPlaylistStoreBase, Store {
  final _$playlistMovieAtom =
      Atom(name: '_VideoViewPlaylistStoreBase.playlistMovie');

  @override
  PlaylistMovie? get playlistMovie {
    _$playlistMovieAtom.reportRead();
    return super.playlistMovie;
  }

  @override
  set playlistMovie(PlaylistMovie? value) {
    _$playlistMovieAtom.reportWrite(value, super.playlistMovie, () {
      super.playlistMovie = value;
    });
  }

  final _$videoControllerAtom =
      Atom(name: '_VideoViewPlaylistStoreBase.videoController');

  @override
  YoutubePlayerController? get videoController {
    _$videoControllerAtom.reportRead();
    return super.videoController;
  }

  @override
  set videoController(YoutubePlayerController? value) {
    _$videoControllerAtom.reportWrite(value, super.videoController, () {
      super.videoController = value;
    });
  }

  final _$isloadedAtom = Atom(name: '_VideoViewPlaylistStoreBase.isloaded');

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

  final _$showOverLayAtom =
      Atom(name: '_VideoViewPlaylistStoreBase.showOverLay');

  @override
  bool get showOverLay {
    _$showOverLayAtom.reportRead();
    return super.showOverLay;
  }

  @override
  set showOverLay(bool value) {
    _$showOverLayAtom.reportWrite(value, super.showOverLay, () {
      super.showOverLay = value;
    });
  }

  final _$isFullScreenAtom =
      Atom(name: '_VideoViewPlaylistStoreBase.isFullScreen');

  @override
  bool get isFullScreen {
    _$isFullScreenAtom.reportRead();
    return super.isFullScreen;
  }

  @override
  set isFullScreen(bool value) {
    _$isFullScreenAtom.reportWrite(value, super.isFullScreen, () {
      super.isFullScreen = value;
    });
  }

  final _$currentPositionAtom =
      Atom(name: '_VideoViewPlaylistStoreBase.currentPosition');

  @override
  int get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(int value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$durationAtom = Atom(name: '_VideoViewPlaylistStoreBase.duration');

  @override
  int get duration {
    _$durationAtom.reportRead();
    return super.duration;
  }

  @override
  set duration(int value) {
    _$durationAtom.reportWrite(value, super.duration, () {
      super.duration = value;
    });
  }

  final _$isBufferingAtom =
      Atom(name: '_VideoViewPlaylistStoreBase.isBuffering');

  @override
  bool get isBuffering {
    _$isBufferingAtom.reportRead();
    return super.isBuffering;
  }

  @override
  set isBuffering(bool value) {
    _$isBufferingAtom.reportWrite(value, super.isBuffering, () {
      super.isBuffering = value;
    });
  }

  final _$episodesAtom = Atom(name: '_VideoViewPlaylistStoreBase.episodes');

  @override
  ObservableList<Movie> get episodes {
    _$episodesAtom.reportRead();
    return super.episodes;
  }

  @override
  set episodes(ObservableList<Movie> value) {
    _$episodesAtom.reportWrite(value, super.episodes, () {
      super.episodes = value;
    });
  }

  final _$mMovieOriginalsListAtom =
      Atom(name: '_VideoViewPlaylistStoreBase.mMovieOriginalsList');

  @override
  List<Movie> get mMovieOriginalsList {
    _$mMovieOriginalsListAtom.reportRead();
    return super.mMovieOriginalsList;
  }

  @override
  set mMovieOriginalsList(List<Movie> value) {
    _$mMovieOriginalsListAtom.reportWrite(value, super.mMovieOriginalsList, () {
      super.mMovieOriginalsList = value;
    });
  }

  final _$isExpandedAtom = Atom(name: '_VideoViewPlaylistStoreBase.isExpanded');

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

  final _$currentMovieAtom =
      Atom(name: '_VideoViewPlaylistStoreBase.currentMovie');

  @override
  Movie? get currentMovie {
    _$currentMovieAtom.reportRead();
    return super.currentMovie;
  }

  @override
  set currentMovie(Movie? value) {
    _$currentMovieAtom.reportWrite(value, super.currentMovie, () {
      super.currentMovie = value;
    });
  }

  final _$initAsyncAction = AsyncAction('_VideoViewPlaylistStoreBase.init');

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  final _$changeMoviePlayerAsyncAction =
      AsyncAction('_VideoViewPlaylistStoreBase.changeMoviePlayer');

  @override
  Future<void> changeMoviePlayer(Movie? movie) {
    return _$changeMoviePlayerAsyncAction
        .run(() => super.changeMoviePlayer(movie));
  }

  final _$saveProgressAsyncAction =
      AsyncAction('_VideoViewPlaylistStoreBase.saveProgress');

  @override
  Future<bool> saveProgress() {
    return _$saveProgressAsyncAction.run(() => super.saveProgress());
  }

  final _$_VideoViewPlaylistStoreBaseActionController =
      ActionController(name: '_VideoViewPlaylistStoreBase');

  @override
  dynamic changeExpanded() {
    final _$actionInfo = _$_VideoViewPlaylistStoreBaseActionController
        .startAction(name: '_VideoViewPlaylistStoreBase.changeExpanded');
    try {
      return super.changeExpanded();
    } finally {
      _$_VideoViewPlaylistStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
playlistMovie: ${playlistMovie},
videoController: ${videoController},
isloaded: ${isloaded},
showOverLay: ${showOverLay},
isFullScreen: ${isFullScreen},
currentPosition: ${currentPosition},
duration: ${duration},
isBuffering: ${isBuffering},
episodes: ${episodes},
mMovieOriginalsList: ${mMovieOriginalsList},
isExpanded: ${isExpanded},
currentMovie: ${currentMovie}
    ''';
  }
}
