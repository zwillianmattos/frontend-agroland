import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
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
        title: Observer(builder: (_) {
          return Text('Curso: ${controller.movie?.title}');
        }),
      ),
      body: Observer(
        builder: (_) {
          if (!controller.isloaded)
            return Center(
              child: CircularProgressIndicator(),
            );

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Observer(builder: (_) {
                        return Center(
                            child: moviePost(controller.videoPlayerController));
                      }),
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: headingText(
                            context,
                            "${controller.movie?.title}",
                          )),
                          IconButton(
                            icon: Icon(!controller.isExpanded
                                ? Icons.arrow_drop_down
                                : Icons.arrow_drop_up),
                            onPressed: () {
                              controller.changeExpanded();
                            },
                            color: color_textColorPrimary,
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.center,
                      ).paddingOnly(
                        left: spacing_standard_new,
                        right: spacing_control_half,
                      ),
                      itemSubTitle(context, "${controller.movie?.title}",
                              isLongText: false)
                          .paddingOnly(
                              left: spacing_standard_new,
                              right: spacing_standard_new),
                      Observer(builder: (x) {
                        if (!controller.isExpanded) return Container();

                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            itemSubTitle(
                                context, "${controller.movie?.subtitle}",
                                fontsize: textSizeSMedium, isLongText: false),
                            itemSubTitle(context, "${controller.movie?.author}",
                                colorThird: true,
                                fontsize: textSizeSMedium,
                                isLongText: false),
                          ],
                        ).paddingOnly(
                            left: spacing_standard_new,
                            right: spacing_standard_new,
                            bottom: spacing_standard_new);
                      }),
                      buttonsVideo,
                      Divider(
                        thickness: 1,
                        height: 1,
                      ).paddingTop(spacing_standard),
                    ],
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
