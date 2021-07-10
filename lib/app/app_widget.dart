import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agro Land',
      initialRoute: '/splash',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: color_colorPrimary,
        primarySwatch: Colors.green,
        fontFamily: 'Product Sans',
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Product Sans'),
        ),
      ),
    ).modular();
  }
}
