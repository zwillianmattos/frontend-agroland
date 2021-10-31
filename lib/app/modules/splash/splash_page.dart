import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:universal_io/io.dart' as IO;

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Tween<double> _scaleTween = Tween<double>(begin: 0.1, end: 0.5);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TweenAnimationBuilder<double>(
            builder: (BuildContext context, double? scale, Widget? child) {
              return Transform.scale(scale: scale!, child: child);
            },
            duration: Duration(milliseconds: 2000),
            tween: _scaleTween,
            child: Image.asset(
              'images/logo_tcc3.png',
            ),
            onEnd: () async {
              if (Modular.get<UserPreferencesStore>().getUser != null) {
                Modular.to.pushReplacementNamed('/');
              } else {
                Modular.to.pushReplacementNamed('/account/auth');
              }
            }),
      ),
    );
  }
}
