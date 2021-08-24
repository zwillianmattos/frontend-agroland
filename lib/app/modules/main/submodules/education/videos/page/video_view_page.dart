import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:universal_io/io.dart' as IO;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:youtube_player_iframe/youtube_player_iframe.dart';
import 'package:nb_utils/nb_utils.dart';

import 'video_view_store.dart';

class VideoViewPage extends StatefulWidget {
  const VideoViewPage({Key? key}) : super(key: key);

  @override
  _VideoViewPageState createState() => _VideoViewPageState();
}

class _VideoViewPageState extends ModularState<VideoViewPage, VideoViewStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('VideoViewPage'),
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Column(
            children: [
              LayoutBuilder(builder: (context, constraints) {
                print(constraints.maxWidth);
                if ((kIsWeb || IO.Platform.isWindows) &&
                    constraints.maxWidth > 800) {
                  return Center(
                    child: SizedBox(
                        height: 800,
                        child: YoutubePlayerControllerProvider(
                          // Provides controller to all the widget below it.
                          controller: controller.videoPlayerController!,
                          child: YoutubePlayerIFrame(),
                        )),
                  );
                }

                return YoutubePlayerControllerProvider(
                  // Provides controller to all the widget below it.
                  controller: controller.videoPlayerController!,
                  child: YoutubePlayerIFrame(
                    aspectRatio: 16 / 9,
                  ),
                );
              }).paddingAll(spacing_standard_new),
            ],
          );
        },
      ),
    );
  }
}
