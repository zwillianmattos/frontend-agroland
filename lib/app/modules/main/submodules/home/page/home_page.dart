import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/home/models/news.dart';
import 'package:plant_care/app/modules/main/submodules/home/stores/home_store.dart';
import 'package:relative_scale/relative_scale.dart';
import '../../../bottom_navigator_store.dart';
import '../widgets/weather/page/weather_widget.dart';
import '../widgets/acoes/widgets/cotacao_widget.dart';

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
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Scaffold(
        backgroundColor: color_app_background,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: color_app_background,
                floating: false,
                pinned: false,
                leading: IconButton(
                    icon: SvgPicture.asset(
                      "images/user_broken.svg",
                    ),
                    onPressed: () {}),
                centerTitle: true,
                title: Image.asset(
                  'images/logo.png',
                  scale: 2.5,
                ),
                actions: [
                  IconButton(
                      icon: SvgPicture.asset(
                        "images/search_broken.svg",
                      ),
                      onPressed: () {}),
                  IconButton(
                      icon: SvgPicture.asset(
                        "images/notification_broken.svg",
                      ),
                      onPressed: () {})
                ],
              ),
            ];
          },
          body: Container(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  WeatherWidget(),
                  SizedBox(
                    height: width > 400 ? sy(80) : 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        CardButton(
                            icon: SvgPicture.asset(
                              "images/camera_bulk.svg",
                            ),
                            description: "Camera"),
                        CardButton(
                            icon: SvgPicture.asset(
                              "images/document_bulk.svg",
                            ),
                            description: "Ebooks"),
                        CardButton(
                            icon: SvgPicture.asset(
                              "images/folder_bulk.svg",
                            ),
                            description: "Courses"),
                      ],
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                    ),
                  ),
                  appLabelViewAll("Notícias"),
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
                                  left: 16, right: 16, bottom: 24, top: 0),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                color: white,
                                image: DecorationImage(
                                  image:
                                      NetworkImage(item.urlToImage.toString()),
                                  fit: BoxFit.cover,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.15),
                                    spreadRadius: 0,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              width: sx(width),
                              child: InkWell(
                                onTap: () {
                                  Modular.to.pushNamed("/home/news",
                                      arguments: item, forRoot: true);
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        stops: [
                                          0.1,
                                          0.7
                                        ],
                                        colors: [
                                          Colors.black.withOpacity(0.8),
                                          Colors.transparent
                                        ]),
                                  ),
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
                              ),
                            );
                          });
                    }),
                  ),
                  appLabelViewAll("Cotação"),
                  CotacaoWidget(),
                  SizedBox(height: 40),
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
                        color: Colors.grey.withOpacity(0.15),
                        spreadRadius: 0,
                        blurRadius: 5,
                        offset: Offset(0, 0), // changes position of shadow
                      ),
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

class CardButton extends StatelessWidget {
  final Widget icon;
  final String description;

  const CardButton({Key? key, required this.icon, required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        margin: EdgeInsets.only(left: 13, right: 13, bottom: 16, top: 16),
        padding: EdgeInsets.only(left: 16, right: 13, bottom: 16, top: 16),
        width: sx(width / 1.8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          color: color_colorPrimary,
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.15),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            icon,
            text(description, textColor: color_white, fontSize: 15.0),
          ],
        ),
        alignment: Alignment.center,
      );
    });
  }
}
