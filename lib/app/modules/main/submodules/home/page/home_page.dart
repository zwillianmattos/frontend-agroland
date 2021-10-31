import 'package:agro_tools/app/modules/main/submodules/home/stores/home_store.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/acoes/widgets/cotacao_widget.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/news/page/news_widget.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/page/weather_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/consts/texts.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:relative_scale/relative_scale.dart';
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
        return NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [];
          },
          body: Container(
            width: width > 500 ? sx(250) : width,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  if (IO.Platform.isIOS) SizedBox(height: 40),
                  WeatherWidget(),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color:
                              Theme.of(context).shadowColor.withOpacity(0.15),
                          spreadRadius: 0,
                          blurRadius: 5,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              onTap: () {
                                Modular.to.pushNamed('/tools',
                                    forRoot: (IO.Platform.isAndroid ||
                                            IO.Platform.isIOS)
                                        ? true
                                        : false);
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    PlatformSvg.asset("images/camera_bulk.svg",
                                        context: context),
                                    text(
                                      "Identif.",
                                      fontSize: textSizeSMedium,
                                      isLongText: true,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Modular.to.pushNamed('/cultures',
                                    forRoot: (IO.Platform.isAndroid ||
                                            IO.Platform.isIOS)
                                        ? true
                                        : false);
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    PlatformSvg.asset(
                                        "images/document_bulk.svg",
                                        context: context),
                                    text(
                                      "Diagnóstico",
                                      fontSize: textSizeSMedium,
                                      isLongText: true,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Modular.to.pushNamed('/education',
                                    arguments: {'tab_index': 0},
                                    forRoot: (IO.Platform.isAndroid ||
                                            IO.Platform.isIOS)
                                        ? true
                                        : false);
                                // Modular.get<BottomNavigatorStore>()
                                //     .changePage(3);
                              },
                              child: Container(
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  children: [
                                    PlatformSvg.asset("images/folder_bulk.svg",
                                        context: context),
                                    text(
                                      "Educação",
                                      fontSize: textSizeSMedium,
                                      isLongText: true,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            // InkWell(
                            //   onTap: () {},
                            //   child: Container(
                            //     padding: EdgeInsets.all(15),
                            //     child: Column(
                            //       children: [
                            //         PlatformSvg.asset("images/plan_bulk.svg",
                            //             context: context),
                            //         text(
                            //           "Premium",
                            //           fontSize: textSizeSMedium,
                            //           isLongText: true,
                            //         )
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  headingWidViewAll(context, "Notícias", () {
                    Modular.to.pushNamed('/home/news',
                        forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS)
                            ? true
                            : false);
                  }),
                  NewsWidget(),
                  headingWidViewAll(context, "Cotação", () {},
                      desativaBotao: true),
                  CotacaoWidget(),
                  SizedBox(height: 50),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
