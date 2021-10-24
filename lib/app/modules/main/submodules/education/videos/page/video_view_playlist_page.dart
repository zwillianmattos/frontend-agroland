import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'video_view_playlist_store.dart';

class VideoViewPlaylistPage extends StatefulWidget {
  const VideoViewPlaylistPage({Key? key}) : super(key: key);

  @override
  _VideoViewPlaylistPageState createState() => _VideoViewPlaylistPageState();
}

class _VideoViewPlaylistPageState
    extends ModularState<VideoViewPlaylistPage, VideoViewPlaylistStore> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var episodesList = Container(
      height: width <= 1000
          ? ((width / 2) - 36) * (2.5 / 4) + 40
          : (width * 0.28) * 2.8 / 6,
      child: Observer(builder: (_) {
        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.episodes.length,
            padding: EdgeInsets.only(
                left: spacing_standard, right: spacing_standard_new),
            itemBuilder: (context, index) {
              return Container(
                margin: EdgeInsets.only(left: spacing_standard),
                width: width <= 1000 ? (width / 2) - 36 : (width * 0.2),
                child: InkWell(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: AspectRatio(
                          aspectRatio: 4 / 2.5,
                          child: Card(
                            semanticContainer: true,
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            elevation: spacing_control_half,
                            margin: EdgeInsets.all(0),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(spacing_control),
                            ),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: <Widget>[
                                networkImage(
                                    controller.episodes[index].slideImage!,
                                    aWidth: double.infinity,
                                    aHeight: double.infinity),
                                Container(
                                  decoration: boxDecoration(
                                      bgColor: Colors.white.withOpacity(0.8)),
                                  padding: EdgeInsets.only(
                                      left: spacing_control,
                                      right: spacing_control),
                                  child: text("Aula " + (index + 1).toString(),
                                      fontSize: 10.0,
                                      textColor: Colors.black,
                                      fontFamily: fontMedium),
                                ).paddingAll(spacing_control)
                              ],
                            ),
                          ),
                        ),
                      ),
                      text(
                        "${controller.episodes[index].title}",
                        textColor: color_textColorPrimary,
                        fontSize: textSizeSmall,
                        maxLine: 2,
                      ).paddingAll(spacing_control_half),
                    ],
                  ),
                  onTap: () {
                    controller.changeMoviePlayer(controller.episodes[index]);
                  },
                  radius: spacing_control,
                ),
              );
            });
      }),
    );

    return WillPopScope(
      onWillPop: () async {
        // return await controller.saveProgress();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Observer(builder: (_) {
            return Text('Curso: ${controller.currentMovie?.title}');
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
                          return moviePost(controller.videoController);
                        }),
                        Row(
                          children: <Widget>[
                            Expanded(
                                child: headingText(
                              context,
                              "${controller.playlistMovie?.title}",
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
                        itemSubTitle(
                                context, "${controller.currentMovie?.title}",
                                isLongText: false)
                            .paddingOnly(
                                left: spacing_standard_new,
                                right: spacing_standard_new),
                        Observer(builder: (x) {
                          if (!controller.isExpanded) return Container();

                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              itemSubTitle(context,
                                  "${controller.currentMovie?.subtitle}",
                                  fontsize: textSizeSMedium, isLongText: false),
                              itemSubTitle(
                                  context, "${controller.currentMovie?.author}",
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
                        headingWidViewAll(context, "Aulas", () {})
                            .paddingAll(spacing_standard_new),
                        episodesList
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
