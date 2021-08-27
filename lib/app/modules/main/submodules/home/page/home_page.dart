import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/bottom_navigator_store.dart';
import './home_store.dart';
import 'package:relative_scale/relative_scale.dart';
import '../widgets/weather/page/weather_widget.dart';
import '../widgets/acoes/widgets/cotacao_widget.dart';
import '../widgets/news/page/news_widget.dart';
import 'package:universal_io/io.dart' as IO;

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends ModularState<DashboardPage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: color_app_background,
      body: RelativeBuilder(builder: (context, height, width, sy, sx) {
        final Widget buttons = SizedBox(
          height: width > 500 ? sy(60) : 100,
          width: width >= 1024 ? 1024 : width,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // CardButton(
              //   icon: PlatformSvg.asset("images/camera_bulk.svg",
              //       context: context),
              //   description: "Camera",
              // ),
              CardButton(
                icon: PlatformSvg.asset(
                  "images/document_bulk.svg",
                  context: context,
                ),
                description: "Ebooks",
                onPressed: () {
                  Modular.get<BottomNavigatorStore>()
                      .changePage(3, arguments: {
                    'tab_index': 1,
                  });
                },
              ),
              CardButton(
                  icon: PlatformSvg.asset(
                    "images/folder_bulk.svg",
                    context: context,
                  ),
                  description: "Culturas",
                  onPressed: () {
                    Modular.to.pushNamed('/cultures',
                        forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                            ? true
                            : false);
                  }),
            ],
            shrinkWrap: true,
            physics: ScrollPhysics(),
          ),
        );

        return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              // SliverAppBar(
              //   backgroundColor: color_app_background,
              //   floating: false,
              //   pinned: false,
              //   leading: IconButton(
              //       icon: PlatformSvg.asset("images/user_broken.svg",
              //           context: context),
              //       onPressed: () async {
              //         if (Modular.get<UserPreferencesStore>().getUser != null) {
              //           Modular.to.pushNamed('/account/profile');
              //         } else {
              //           Modular.to.pushNamed('/account/auth');
              //         }
              //       }),
              //   centerTitle: true,
              //   title: Image.asset(
              //     'images/logo.png',
              //     scale: 2.5,
              //   ),
              //   actions: [
              //     IconButton(
              //         icon: PlatformSvg.asset("images/search_broken.svg",
              //             context: context),
              //         onPressed: () {}),
              //     IconButton(
              //         icon: PlatformSvg.asset("images/notification_broken.svg",
              //             context: context),
              //         onPressed: () {})
              //   ],
              // ),
            ];
          },
          body: Container(
            width: width > 500 ? sx(250) : width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  WeatherWidget(),
                  buttons,
                  headingWidViewAll(context, "Notícias", () {
                    
                  }),
                  NewsWidget(),
                  headingWidViewAll(context, "Cotação", () {

                  }),
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
