import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/page/news_view_more_store.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/page/news_widget.dart';

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
          NewsWidget(
            horizontal: false,
          ),
          Container()
        ]),
      ),
    );
  }
}
