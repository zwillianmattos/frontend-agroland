import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/modules/main/submodules/home/models/news.dart';
import 'package:plant_care/app/modules/main/submodules/home/stores/home_store.dart';
import 'package:plant_care/app/widgets/widgets.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:weather/weather.dart';

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
            return <Widget>[
              SliverAppBar(
                expandedHeight: expandHeight,
                floating: true,
                forceElevated: innerBoxIsScrolled,
                pinned: false,
                titleSpacing: 16,
                backgroundColor: innerBoxIsScrolled
                    ? color_colorPrimary
                    : color_colorPrimary,
                actionsIconTheme: IconThemeData(opacity: 0.0),
                title: innerBoxIsScrolled
                    ? text("PlantCare",
                        textColor: color_white,
                        fontSize: textSizeLarge,
                        fontFamily: fontFamilyBoldGlobal)
                    : null,
                flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                    height: 100,
                    color: color_colorPrimary,
                    child: Container(
                      margin: EdgeInsets.only(
                          top: 20, bottom: 20, left: 16, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 6,
                                child: text("Ola Fulano",
                                    textColor: color_white,
                                    fontSize: textSizeLarge,
                                    fontFamily: fontFamilyBoldGlobal),
                              ),
                              Expanded(
                                  child: IconButton(
                                icon: Icon(Typicons.bell),
                                color: Colors.white,
                                onPressed: () {},
                              )),
                              Expanded(
                                  child: IconButton(
                                      icon: Icon(Typicons.user),
                                      color: Colors.white,
                                      onPressed: () {}))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 10, right: 16, top: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                        color: white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.06),
                            spreadRadius: 5,
                            blurRadius: 10,
                            offset: Offset(0, 0), // changes position of shadow
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
                  SizedBox(height: 8),
                  appLabelViewAll("Ferramentas"),
                  SizedBox(
                    height: width > 400 ? sy(80) : 120,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 6,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                left: 16, right: 16, bottom: 16, top: 16),
                            child: Container(
                              width: sx(92),
                              height: sy(92),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.06),
                                    spreadRadius: 5,
                                    blurRadius: 10,
                                    offset: Offset(
                                        0, 0), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Icon(Typicons.leaf, size: sy(12)),
                              alignment: Alignment.center,
                            ),
                          );
                        }),
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
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: ScrollPhysics(),
                          itemBuilder: (context, index) {
                            NewsModel item = controller.newsList[index];

                            return InkWell(
                              onTap: () {
                                // String slug = item.title!.trim()..toSlug();
                                Modular.to
                                    .pushNamed("/home/news", arguments: item);

                                return;
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    left: 16, right: 16, bottom: 16, top: 16),
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12)),
                                  color: white,
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        item.urlToImage.toString()),
                                    fit: BoxFit.cover,
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.06),
                                      spreadRadius: 5,
                                      blurRadius: 10,
                                      offset: Offset(
                                          0, 0), // changes position of shadow
                                    ),
                                  ],
                                ),
                                width: width > 400 ? sx(150) : sx(width),
                                child: Align(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
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
                  SizedBox(
                    child: Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(12)),
                          color: white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.06),
                              spreadRadius: 5,
                              blurRadius: 10,
                              offset:
                                  Offset(0, 0), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 35.0),
                              child: Center(
                                child: Location(location: "Agudos"),
                              ),
                            ),
                            Center(
                              child: LastUpdated(dateTime: DateTime.now()),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 50.0),
                              child: Center(
                                child: CombinedWeatherTemperature(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16)
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}

class Location extends StatelessWidget {
  final String location;

  Location({required this.location});

  @override
  Widget build(BuildContext context) {
    return Text(
      location,
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
        color: blackColor,
      ),
    );
  }
}

class LastUpdated extends StatelessWidget {
  final DateTime dateTime;

  LastUpdated({required this.dateTime});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Updated: ${TimeOfDay.fromDateTime(dateTime).format(context)}',
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w200,
        color: blackColor,
      ),
    );
  }
}

class CombinedWeatherTemperature extends StatelessWidget {
  // final Weather weather;

  CombinedWeatherTemperature();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Container(
                child: Text("asdasd"),
              ),
              //  WeatherConditions(condition: WeatherCondition.hail),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Temperature(
                temperature: 30,
                high: 2,
                low: 2,
              ),
            ),
          ],
        ),
        Center(
          child: Text(
            "teste",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w200,
              color: blackColor,
            ),
          ),
        ),
      ],
    );
  }
}

class WeatherConditions extends StatelessWidget {
  final WeatherCondition condition;

  WeatherConditions({required this.condition});

  @override
  Widget build(BuildContext context) => _mapConditionToImage(condition);

  Image _mapConditionToImage(WeatherCondition condition) {
    Image image;
    switch (condition) {
      case WeatherCondition.clear:
      case WeatherCondition.lightCloud:
        image = Image.asset('assets/clear.png');
        break;
      case WeatherCondition.hail:
      case WeatherCondition.snow:
      case WeatherCondition.sleet:
        image = Image.asset('assets/snow.png');
        break;
      case WeatherCondition.heavyCloud:
        image = Image.asset('assets/cloudy.png');
        break;
      case WeatherCondition.heavyRain:
      case WeatherCondition.lightRain:
      case WeatherCondition.showers:
        image = Image.asset('assets/rainy.png');
        break;
      case WeatherCondition.thunderstorm:
        image = Image.asset('assets/thunderstorm.png');
        break;
      case WeatherCondition.unknown:
        image = Image.asset('assets/clear.png');
        break;
    }
    return image;
  }
}

enum WeatherCondition {
  snow,
  sleet,
  hail,
  thunderstorm,
  heavyRain,
  lightRain,
  showers,
  heavyCloud,
  lightCloud,
  clear,
  unknown
}

class Temperature extends StatelessWidget {
  final double temperature;
  final double low;
  final double high;

  Temperature({
    required this.temperature,
    required this.low,
    required this.high,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(right: 20.0),
          child: Text(
            '${_formattedTemperature(temperature)}°',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              color: blackColor,
            ),
          ),
        ),
        Column(
          children: [
            Text(
              'max: ${_formattedTemperature(high)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: blackColor,
              ),
            ),
            Text(
              'min: ${_formattedTemperature(low)}°',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w100,
                color: blackColor,
              ),
            )
          ],
        )
      ],
    );
  }

  int _formattedTemperature(double t) => t.round();
}
