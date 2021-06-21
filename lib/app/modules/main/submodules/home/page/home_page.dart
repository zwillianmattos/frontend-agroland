import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/modules/main/submodules/home/models/news.dart';
import 'package:plant_care/app/modules/main/submodules/home/stores/home_store.dart';
import 'package:plant_care/app/widgets/widgets.dart';
import 'package:relative_scale/relative_scale.dart';
import '../../../bottom_navigator_store.dart';
import '../widgets/weather/page/weather_widget.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends ModularState<DashboardPage, HomeStore> {
  List mList1 = [];
  List mList2 = [];
  List mList3 = [];

  var _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    double expandHeight = 150;
    double w = MediaQuery.of(context).size.width;

    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        backgroundColor: color_app_background,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: color_colorPrimary,
                floating: true,
                pinned: false,
                collapsedHeight: 100,
                expandedHeight: 100,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: Padding(
                    padding: EdgeInsets.only(left: 10, right: 16, top: 16),
                    child: Container(
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(3100)),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.15),
                            spreadRadius: 2,
                            blurRadius: 19,
                            offset: Offset(4, 6), // changes position of shadow
                          ),
                        ],
                      ),
                      child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          decoration: InputDecoration(
                            fillColor: color_white,
                            hintText: "Buscar",
                            border: InputBorder.none,
                            prefixIcon: Icon(Typicons.search_outline),
                            contentPadding: EdgeInsets.only(
                                left: 26.0, bottom: 8.0, top: 8.0, right: 50.0),
                          )),
                      alignment: Alignment.center,
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  SizedBox(height: 20),
                  SizedBox(
                    height: width > 400 ? sy(80) : 120,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, bottom: 16, top: 16),
                          child: Container(
                            width: sx(128),
                            height: sy(92),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 2,
                                  blurRadius: 19,
                                  offset: Offset(
                                      4, 6), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Icon(
                              Typicons.camera,
                              size: sy(12),
                              color: color_colorPrimary,
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, bottom: 16, top: 16),
                          child: Container(
                            width: sx(128),
                            height: sy(92),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3)),
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 2,
                                  blurRadius: 19,
                                  offset: Offset(
                                      4, 6), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Icon(
                              Typicons.leaf,
                              size: sy(12),
                              color: color_colorPrimary,
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 16, right: 16, bottom: 16, top: 16),
                          child: InkWell(
                            onTap: controller.ebookPage,
                            child: Container(
                              width: sx(128),
                              height: sy(92),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 2,
                                    blurRadius: 19,
                                    offset: Offset(
                                        4, 6), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(
                                Typicons.bookmark,
                                size: sy(12),
                                color: color_colorPrimary,
                              ),
                              alignment: Alignment.center,
                            ),
                          ),
                        ),
                      ],
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                    ),
                  ),
                  appLabelViewAll("Noticias"),
                  SizedBox(
                    height: width > 400 ? sy(150) : 200,
                    child: Observer(builder: (context) {
                      if (controller.newsList.length <= 0)
                        return Center(
                          child: CircularProgressIndicator(),
                        );

                      return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.newsList.length,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            NewsModel item = controller.newsList[index];

                            return Container(
                              margin: EdgeInsets.only(
                                  left: 16, right: 16, bottom: 24, top: 16),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(3)),
                                color: white,
                                image: DecorationImage(
                                  image:
                                      NetworkImage(item.urlToImage.toString()),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 2,
                                    blurRadius: 19,
                                    offset: Offset(
                                        4, 6), // changes position of shadow
                                  ),
                                ],
                              ),
                              width: sx(width),
                              child: InkWell(
                                onTap: () {
                                  Modular.to.pushNamed("/home/news",
                                      arguments: item, forRoot: true);
                                },
                                child: Align(
                                  child: Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Text(
                                      item.title.toString(),
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  alignment: Alignment.bottomCenter,
                                ),
                              ),
                            );
                          });
                    }),
                  ),
                  appLabelViewAll("Previsao do Tempo"),
                  WeatherWidget(),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class _Search extends StatefulWidget {
  _Search({Key? key}) : super(key: key);

  @override
  __SearchState createState() => __SearchState();
}

class __SearchState extends State<_Search> {
  TextEditingController? _editingController;

  @override
  void initState() {
    super.initState();
    _editingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _editingController,
              // textAlignVertical: TextAlignVertical.center,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                    color: Theme.of(context).primaryColor.withOpacity(0.5)),
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
          _editingController!.text.trim().isEmpty
              ? IconButton(
                  icon: Icon(Icons.search,
                      color: Theme.of(context).primaryColor.withOpacity(0.5)),
                  onPressed: null)
              : IconButton(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: Icon(Icons.clear,
                      color: Theme.of(context).primaryColor.withOpacity(0.5)),
                  onPressed: () => setState(
                    () {
                      _editingController!.clear();
                    },
                  ),
                ),
        ],
      ),
    );
  }
}

class SearchHeader {
  final double minTopBarHeight = 100;
  final double maxTopBarHeight = 200;
  final String? title;
  final IconData? icon;
  final Widget? search;

  SearchHeader({
    @required this.title,
    this.icon,
    this.search,
  });

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    var shrinkFactor = min(1, shrinkOffset / (maxExtent - minExtent));

    var topBar = Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: Container(
        alignment: Alignment.center,
        height:
            max(maxTopBarHeight * (1 - shrinkFactor * 1.45), minTopBarHeight),
        width: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title!,
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              icon,
              size: 40,
              color: Colors.white,
            )
          ],
        ),
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(36),
              bottomRight: Radius.circular(36),
            )),
      ),
    );
    return Container(
      height: max(maxExtent - shrinkOffset, minExtent),
      child: Stack(
        fit: StackFit.loose,
        children: [
          if (shrinkFactor <= 0.5) topBar,
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Container(
                alignment: Alignment.center,
                child: search,
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 10,
                        color: Colors.green.withOpacity(0.23),
                      )
                    ]),
              ),
            ),
          ),
          if (shrinkFactor > 0.5) topBar,
        ],
      ),
    );
  }

  @override
  double get maxExtent => 230;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
