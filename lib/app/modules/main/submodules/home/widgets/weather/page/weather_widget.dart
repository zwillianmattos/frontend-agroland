import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/models/weather.dart';
import 'package:relative_scale/relative_scale.dart';
import 'weather_store.dart';

class WeatherWidget extends StatefulWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  _WeatherWidgetState createState() => _WeatherWidgetState();
}

class _WeatherWidgetState extends ModularState<WeatherWidget, WeatherStore> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(builder: (context, height, width, sy, sx) {
      return Container(
        width:width >= 1024 ?  1024 : width,
        margin: EdgeInsets.all(16),
        child: Observer(builder: (_) {
          if (controller.isLoading)
            return Center(child: CircularProgressIndicator());

          if (controller.wheater == null)
            return Container(
              child: appButton(
                textContent: "Tentar novamente",
                onPressed: controller.loadWeather,
              ),
            );
          Weather w = controller.wheater!;

          return SizedBox(
            width: width,
            height: width >= 1024 ? sy(120) : 130,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
                color: color_white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Stack(
                children: [
                  ClippedPartsWidget(
                    top: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: color_white,
                      ),
                    ),
                    bottom: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        color: color_colorPrimary.withOpacity(0.1),
                      ),
                    ),
                    splitFunction: (Size size, double x) {
                      // normalizing x to make it exactly one wave
                      final normalizedX = x / size.width * 2 * pi;
                      final waveHeight = size.height / 2;
                      final y = size.height / 2 - sin(normalizedX) * waveHeight;

                      return y;
                    },
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: width >= 1024 ? sx(180) : 150,
                                  child: text(
                                    "${w.results!.temp!}°c",
                                    fontSize: 32.0,
                                  ),
                                ),
                                Container(
                                  width: width >= 1024 ? 70 : 70,
                                  height: width >= 1024 ? sy(5) : 10,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      scale: width >= 1024 ? sx(0.3) : 1.7,
                                      centerSlice: Rect.fromLTRB(1, 1, 1, 1),
                                      fit: BoxFit.fitHeight,
                                      alignment: Alignment.centerLeft,
                                      image: NetworkImage(
                                          "http://assets.api.hgbrasil.com/weather/images/${w.results!.imgId}.png"),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                text(
                                  "Humidade ${w.results!.humidity!}%",
                                  fontSize: 12.0,
                                ),
                                text(
                                  "Ventos. ${w.results!.windSpeedy!}",
                                  fontSize: 12.0,
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                text(
                                  "${w.results!.city!}",
                                  fontSize: 12.0,
                                ),
                                text(
                                  "${w.results!.description}",
                                  fontSize: 12.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                        // SingleChildScrollView(
                        //   scrollDirection: Axis.horizontal,
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //     crossAxisAlignment: CrossAxisAlignment.center,
                        //     children: w.results!.forecast!
                        //         .map((foreCast) => Container(
                        //               padding: EdgeInsets.all(16.0),
                        //               child: Column(
                        //                   mainAxisAlignment:
                        //                       MainAxisAlignment.spaceAround,
                        //                   crossAxisAlignment:
                        //                       CrossAxisAlignment.center,
                        //                   children: [
                        //                     Text(
                        //                       "${foreCast.date}",
                        //                       style: TextStyle(
                        //                           fontSize: 16,
                        //                           fontWeight: FontWeight.bold),
                        //                     ),
                        //                     Container(
                        //                       child: Row(
                        //                         crossAxisAlignment:
                        //                             CrossAxisAlignment.start,
                        //                         children: [
                        //                           Text(
                        //                             "${foreCast.max}",
                        //                             style: TextStyle(fontSize: 12),
                        //                           ),
                        //                           Text(
                        //                             "°c",
                        //                             style: TextStyle(fontSize: 10),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                     Container(
                        //                       child: Row(
                        //                         crossAxisAlignment:
                        //                             CrossAxisAlignment.start,
                        //                         children: [
                        //                           Text(
                        //                             "${foreCast.min}",
                        //                             style: TextStyle(fontSize: 12),
                        //                           ),
                        //                           Text(
                        //                             "°c",
                        //                             style: TextStyle(fontSize: 10),
                        //                           ),
                        //                         ],
                        //                       ),
                        //                     ),
                        //                   ]),
                        //             ))
                        //         .toList(),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      );
    });
  }
}
