import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/services/local_storage/local_storage.dart';
import 'package:agro_tools/app/modules/main/submodules/education/videos/models/video_model.dart';
import 'package:video_player/video_player.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

part 'video_view_playlist_store.g.dart';

class VideoViewPlaylistStore = _VideoViewPlaylistStoreBase
    with _$VideoViewPlaylistStore;

abstract class _VideoViewPlaylistStoreBase with Store {
  @observable
  PlaylistMovie? playlistMovie;

  @observable
  YoutubePlayerController? videoController;
  @observable
  var isloaded = false;
  @observable
  bool showOverLay = false;
  @observable
  bool isFullScreen = false;
  @observable
  int currentPosition = 0;
  @observable
  int duration = 0;
  @observable
  bool isBuffering = false;
  @observable
  ObservableList<Movie> episodes = <Movie>[].asObservable();
  @observable
  var mMovieOriginalsList = <Movie>[];
  @observable
  var isExpanded = false;

  @observable
  Movie? currentMovie;

  _VideoViewPlaylistStoreBase() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    init();
  }

  @action
  changeExpanded() {
    isExpanded = !isExpanded;
  }

  @action
  init() async {
    isloaded = false;
    playlistMovie = await Modular.args?.data as PlaylistMovie;

    ObservableList<Movie> list = (playlistMovie!.listMovies!).asObservable();
    episodes = list;

    await changeMoviePlayer(playlistMovie?.listMovies?.first);
    isloaded = true;
  }

  @action
  Future<void> changeMoviePlayer(Movie? movie) async {
    if (movie == null) {
      throw ("movie null");
    }

    currentMovie = movie;
    if (videoController != null) {
      videoController?.load("${currentMovie?.id}");
      videoController?.hideTopMenu();
      videoController?.hidePauseOverlay();
    } else {
      videoController = new YoutubePlayerController(
        initialVideoId: "${currentMovie?.id}",
        params: YoutubePlayerParams(
            showControls: true,
            showFullscreenButton: true,
            mute: false,
            autoPlay: true,
            privacyEnhanced: true,
            useHybridComposition: kIsWeb ? true : false,
            showVideoAnnotations: false,
            strictRelatedVideos: false,
            desktopMode: kIsWeb ? true : false,
            color: 'green'),
      );

      videoController?.hideTopMenu();
      videoController?.hidePauseOverlay();
    }

    videoController?.listen((event) {
      currentMovie?.continueDuration = videoController?.value.position;
    });

    isExpanded = false;
  }

  @action
  Future<bool> saveProgress() async {
    var data = await LocalStorage.getValue<String>("recent_videos");
    List<Movie>? recentVideos = [];
    if (data != null && data != '') {
      recentVideos.addAll(jsonDecode(data) as List<Movie>);
    }
    recentVideos.add(currentMovie!);

    List<Map> listMap = recentVideos.map((Movie e) => e.toJson()).toList();
    print(listMap);
    await LocalStorage.setValue("recent_videos", jsonEncode(listMap));
    return true;
  }

  dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
  }
}
