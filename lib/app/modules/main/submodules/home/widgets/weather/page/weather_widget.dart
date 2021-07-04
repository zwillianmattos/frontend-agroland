import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
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
      return Observer(builder: (_) {
        if (controller.wheater == null)
          return Center(child: CircularProgressIndicator());

        Weather w = controller.wheater!;

        return SizedBox(
          width: width,
          height: width > 400 ? sy(160) : 260,
          child: Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(3)),
                color: color_color_twitter,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.15),
                    spreadRadius: 0,
                    blurRadius: 5,
                    offset: Offset(0, 0), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${w.results!.city!}",
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${w.results!.description}",
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Humidade ${w.results!.humidity!}%",
                          ),
                          Text(
                            "Ventos. ${w.results!.windSpeedy!}",
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "${w.results!.temp!}",
                                    style: TextStyle(fontSize: 64),
                                  ),
                                  Text(
                                    "°c",
                                    style: TextStyle(fontSize: 24),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: width / 2.5,
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  scale: 1.2,
                                  centerSlice: Rect.fromLTRB(1, 1, 1, 1),
                                  fit: BoxFit.fitWidth,
                                  alignment: Alignment.centerLeft,
                                  image: NetworkImage(
                                      "http://assets.api.hgbrasil.com/weather/images/${w.results!.imgId}.png"),
                                ),
                              ),
                            ),
                          ]),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: w.results!.forecast!
                          .map((foreCast) => Container(
                                padding: EdgeInsets.all(16.0),
                                child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "${foreCast.date}",
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${foreCast.max}",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              "°c",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "${foreCast.min}",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                            Text(
                                              "°c",
                                              style: TextStyle(fontSize: 10),
                                            ),
                                          ],
                                        ),
                                      ),
                                      // Container(
                                      //   width: 50,
                                      //   height: 50,
                                      //   decoration: BoxDecoration(
                                      //     image: DecorationImage(
                                      //       scale: 1,
                                      //       fit: BoxFit.fitWidth,
                                      //       alignment: Alignment
                                      //           .centerLeft,
                                      //       image: NetworkImage(
                                      //           "http://assets.api.hgbrasil.com/weather/images/${foreCast.}.png"),
                                      //     ),
                                      //   ),
                                      // ),
                                    ]),
                              ))
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
