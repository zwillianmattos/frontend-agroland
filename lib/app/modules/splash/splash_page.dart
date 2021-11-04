import 'package:agro_tools/app/modules/splash/splash_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:mobx/mobx.dart';
import 'package:universal_io/io.dart' as IO;

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashStore> {
  Tween<double> _scaleTween = Tween<double>(begin: 0.1, end: 0.5);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return Center(
          child: TweenAnimationBuilder<double>(
              builder: (BuildContext context, double? scale, Widget? child) {
                return Transform.scale(scale: scale!, child: child);
              },
              duration: Duration(milliseconds: 2000),
              tween: _scaleTween,
              child: Image.asset(
                controller.userPreferencesStore.isDarkThemeEnabled
                    ? 'images/logo_tcc4.png'
                    : 'images/logo_tcc.png',
              ),
              onEnd: () async {
                if (Modular.get<UserPreferencesStore>().getUser != null) {
                  Modular.to.pushReplacementNamed('/');
                } else {
                  Modular.to.pushReplacementNamed('/account/auth');
                }
              }),
        );
      }),
    );
  }
}
