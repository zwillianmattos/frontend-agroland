import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import './home_store.dart';
import 'package:relative_scale/relative_scale.dart';
import '../widgets/weather/page/weather_widget.dart';
import '../widgets/acoes/widgets/cotacao_widget.dart';
import '../widgets/news/page/news_widget.dart';
import 'dart:io' show Platform;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends ModularState<DashboardPage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color_app_background,
      body: RelativeBuilder(builder: (context, height, width, sy, sx) {
        final Widget buttons = SizedBox(
          height: width > 500 ? sy(60) : 100,
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
        );

        return NestedScrollView(
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
            width: width > 500 ? sx(250) : width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (Platform.isAndroid || Platform.isIOS) WeatherWidget(),
                  buttons,
                  appLabelViewAll("Notícias"),
                  NewsWidget(),
                  appLabelViewAll("Cotação"),
                  CotacaoWidget(),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
