import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/consts/texts.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/news/page/news_view_more_store.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/news/page/news_widget.dart';

import 'card_news.dart';

class NewsViewMorePage extends StatefulWidget {
  const NewsViewMorePage({Key? key}) : super(key: key);

  @override
  _NewsViewMorePageState createState() => _NewsViewMorePageState();
}

class _NewsViewMorePageState
    extends ModularState<NewsViewMorePage, NewsViewMoreStore> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            title: Text('Notícias'),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 45),
              child: Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  indicatorPadding: EdgeInsets.only(left: 30, right: 30),
                  indicatorWeight: 3.0,
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelStyle: TextStyle(
                    fontFamily: fontMedium,
                    fontSize: textSizeNormal,
                  ),
                  indicatorColor: Theme.of(context).colorScheme.secondary,
                  unselectedLabelColor: Theme.of(context).secondaryHeaderColor,
                  labelColor: Theme.of(context).colorScheme.secondary,
                  labelPadding: EdgeInsets.only(
                      left: spacing_large, right: spacing_large),
                  tabs: [
                    Tab(child: text("News")),
                    Tab(child: text("Salvos")),
                  ],
                ),
              ),
            )),
        body: TabBarView(children: [
          Container(
            margin: EdgeInsets.only(top: spacing_large),
            child: NewsWidget(
              horizontal: false,
              callback: controller.loadSavedNews,
            ),
          ),
          Observer(builder: (_) {
            if (controller.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            if (controller.listNewsSaved.length > 0) {
              return Container(
                margin: EdgeInsets.only(top: spacing_large),
                child: ListView(
                  children: controller.listNewsSaved.map(
                    (news) {
                      return CardNewsWidget(
                        newsModel: news,
                        horizontal: false,
                        callback: controller.loadSavedNews,
                      );
                    },
                  ).toList(),
                ),
              );
            }

            return Container(
              child: Center(
                child: Text("Nenhuma notícia salva"),
              ),
            );
          })
        ]),
      ),
    );
  }
}
