import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/models/weather.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/page/weather_detail_store.dart';

class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({Key? key}) : super(key: key);

  @override
  _WeatherDetailPageState createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState
    extends ModularState<WeatherDetailPage, WeatherDetailStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: transparentColor,
        elevation: 0,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add_location))],
      ),
      body: Observer(
        builder: (_) {
          if (controller.isLoading)
            return Center(child: CircularProgressIndicator());

          if (controller.weather == null)
            return RetryWidget(
              onRetry: controller.loadWeather,
            );

          Weather w = controller.weather!;
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                text(
                  "${w.results!.city!}",
                  fontSize: 18.0,
                  bold: true,
                ),
                text(
                  "${w.results!.date} - ${w.results!.time}",
                  fontSize: 14.0,
                ),
                SizedBox(
                  height: 50,
                ),
                Center(
                  child: Image.network(
                    "http://assets.api.hgbrasil.com/weather/images/${w.results!.imgId}.png",
                    fit: BoxFit.fill,
                    //centerSlice: new Rect.fromLTRB(10.0, 20.0, 17.0, 25.0),
                    width: 250.0,
                    height: 180.0,
                  ),
                ),
                text(
                  "${w.results!.description}",
                  fontSize: 14.0,
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(children: [
                      text(
                        "Temp",
                        fontSize: 14.0,
                        bold: true,
                      ),
                      text(
                        "${w.results!.temp!}°c",
                        fontSize: 16.0,
                      ),
                    ]),
                    Column(children: [
                      text(
                        "Humidade",
                        fontSize: 14.0,
                        bold: true,
                      ),
                      text(
                        "${w.results!.humidity!}%",
                        fontSize: 16.0,
                      ),
                    ]),
                    Column(children: [
                      text(
                        "Ventos",
                        fontSize: 14.0,
                        bold: true,
                      ),
                      text(
                        "${w.results!.windSpeedy!}",
                        fontSize: 16.0,
                      ),
                    ]),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(children: [
                      text(
                        "Sunrise",
                        fontSize: 14.0,
                        bold: true,
                      ),
                      text(
                        "${w.results!.sunrise!}",
                        fontSize: 16.0,
                      ),
                    ]),
                    Column(children: [
                      text(
                        "Sunset",
                        fontSize: 14.0,
                        bold: true,
                      ),
                      text(
                        "${w.results!.sunset!}",
                        fontSize: 16.0,
                      ),
                    ]),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                headingWidViewAll(context, "Proximos dias", () {}),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: w.results!.forecast!
                        .map(
                          (e) => Container(
                            margin:
                                EdgeInsets.only(left: 16, top: 1, bottom: 1),
                            width: 200,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  spreadRadius: 0,
                                  blurRadius: 5,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                ),
                              ],
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                text(
                                  "${e.date}",
                                  fontSize: 24.0,
                                  bold: true,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    text(
                                      "${e.weekday}",
                                      fontSize: 16.0,
                                    ),
                                    text(
                                      "${e.max}°c",
                                      fontSize: 14.0,
                                    ),
                                    text(
                                      "${e.min}°c",
                                      fontSize: 14.0,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
