import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/consts/colors.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      UserPreferencesStore userStore = Modular.get<UserPreferencesStore>();
      print("darkMode: ${userStore.darkTheme}");

      final darkTheme = ThemeData(
        primarySwatch: Colors.green,
        primaryColor: color_colorPrimary,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.comfortable,
        backgroundColor: const Color(0xFF212121),
        accentColor: color_colorPrimary,
        accentIconTheme: IconThemeData(color: Colors.white),
        dividerColor: Colors.black12,
        fontFamily: 'Product Sans',
        iconTheme: IconThemeData(color: Colors.white),
        primaryIconTheme:
            Theme.of(context).primaryIconTheme.copyWith(color: Colors.white),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
          headline6: TextStyle(
            fontSize: 36.0,
            fontStyle: FontStyle.italic,
          ),
          bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Product Sans'),
        ),
      );

      final lightTheme = ThemeData(
        primarySwatch: Colors.grey,
        primaryColor: color_colorPrimary,
        brightness: Brightness.light,
        backgroundColor: color_app_background,
        accentColor: color_colorPrimary,
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
        initialRoute: '/splash',
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
        theme: userStore.darkTheme ? darkTheme : lightTheme,
      ).modular();
    });
  }
}
