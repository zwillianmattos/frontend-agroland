import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      UserPreferencesStore userStore = Modular.get<UserPreferencesStore>();
      print("darkMode: ${userStore.darkTheme}");
      final darkTheme = ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: color_colorPrimaryDark,
        brightness: Brightness.dark,
        backgroundColor: const Color(0xFF212121),
        accentColor: Colors.white,
        colorScheme: ColorScheme(
          primary: color_colorPrimaryDark,
          primaryVariant: color_color_facebook,
          secondary: color_colorPrimary,
          error: color_colorPrimary,
          onSurface: color_colorPrimary,
          background: color_colorPrimary,
          surface: color_colorPrimaryDark, 
          brightness: Brightness.dark,
          onBackground: Colors.red,
          onError: Colors.red,
          onPrimary:Colors.red,
          onSecondary: Colors.red,
          secondaryVariant: Colors.red,
          
        ),
        accentIconTheme: IconThemeData(color: Colors.black),
        dividerColor: Colors.black12,
        fontFamily: 'Product Sans',
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Product Sans'),
          ),
      );

      final lightTheme = ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: color_colorPrimary,
        brightness: Brightness.light,
        backgroundColor: color_app_background,
        accentColor: Colors.black,
        accentIconTheme: IconThemeData(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
        dividerColor: Colors.white54,
        fontFamily: 'Product Sans',
        textTheme: TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Product Sans'),
          ),
          
      );

      return MaterialApp(
        title: 'Agro Land',
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        theme: userStore.darkTheme ? darkTheme : lightTheme, 
        darkTheme: userStore.darkTheme ? ThemeData.dark() : null,
      ).modular();
    });
  }
}
