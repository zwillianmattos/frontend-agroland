import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/models/news.dart';
import 'package:share_plus/share_plus.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/page/news_view_store.dart';

class NewsViewPage extends StatefulWidget {
  const NewsViewPage({Key? key}) : super(key: key);

  @override
  _NewsViewPageState createState() => _NewsViewPageState();
}

class _NewsViewPageState extends ModularState<NewsViewPage, NewsViewStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              pinned: false,
              title: innerBoxIsScrolled ? Text(controller.news!.title!) : null,
              backgroundColor: color_colorPrimary,
              expandedHeight: 250.0,
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(controller.news!.urlToImage!),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          stops: [
                        0.1,
                        0.3
                      ],
                          colors: [
                        color_app_background.withOpacity(1),
                        Colors.transparent,
                      ])),
                ),
              ),
            ),
          ];
        },
        body: Observer(builder: (_) {
          if (controller.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            // color: color_app_background,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        controller.news!.title!,
                        style: TextStyle(
                            fontFamily: fontBold,
                            fontSize: textSizeNormal,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(controller.news?.author ?? "-"),
                      Text(controller.news?.publishedAt?.toIso8601String() ??
                          "-"),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    controller.news!.content!,
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        icon: Icon(
                          Icons.share,
                          color: Theme.of(context).textTheme.button!.color,
                        ),
                        onPressed: () {
                          Share.share(
                              '${controller.news!.title} - ${controller.news!.url}');
                        },
                      ),
                      Observer(builder: (_) {
                        return IconButton(
                          icon: Icon(
                            controller.favorite
                                ? Typicons.heart_filled
                                : Typicons.heart,
                            color: Theme.of(context).textTheme.button!.color,
                          ),
                          onPressed: () {
                            controller.saveNotice();
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
