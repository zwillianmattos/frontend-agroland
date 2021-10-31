import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/modules/main/submodules/education/videos/models/video_model.dart';
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

part 'video_view_store.g.dart';

class VideoViewStore = _VideoViewStoreBase with _$VideoViewStore;

abstract class _VideoViewStoreBase with Store {
  @observable
  bool isloaded = false;

  @observable
  YoutubePlayerController? videoPlayerController;

  @observable
  var isExpanded = false;

  @observable
  Movie? movie;

  _VideoViewStoreBase() {
    movie = Modular.args?.data as Movie;

    loadDataVideo();
  }

  loadDataVideo() {
    isloaded = false;

    videoPlayerController = YoutubePlayerController(
      initialVideoId: movie!.id!,
      params: YoutubePlayerParams(
          showControls: true,
          showFullscreenButton: true,
          mute: false,
          autoPlay: true,
          showVideoAnnotations: false,
          strictRelatedVideos: false,
          desktopMode: kIsWeb ? true : false,
          color: 'green'),
    )
      ..hideTopMenu()
      ..hidePauseOverlay();
    isloaded = true;
  }

  @action
  changeExpanded() {
    isExpanded = !isExpanded;
  }
}
