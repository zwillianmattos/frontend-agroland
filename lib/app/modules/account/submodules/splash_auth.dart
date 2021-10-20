import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color_colorPrimary,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset(
              'images/logo.png',
              // width: width * 0.6,
              height: width * 0.15,
              fit: BoxFit.contain,
            ).center(),
            Padding(
              padding: const EdgeInsets.all(spacing_standard_new),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: spacing_xxLarge,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 32.0, right: 32.0, bottom: 16.0),
                    child: appButton3(
                      textContent: "Entrar",
                      onPressed: (() {
                        Modular.to.pushNamed('/account/auth/usr',
                            arguments: <String, bool>{
                              'signup': false,
                              'signin': true,
                            });
                      }),
                    ),
                  ),
                  SizedBox(
                    height: spacing_standard,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 32.0, right: 32.0, bottom: 16.0),
                    child: appButton3(
                        textContent: "Cadastrar",
                        onPressed: (() {
                          Modular.to.pushNamed('/account/auth/usr',
                              arguments: <String, bool>{
                                'signup': true,
                                'signin': false,
                              });
                        })),
                  ),
                ],
              ).paddingOnly(bottom: spacing_xxLarge),
            )
          ],
        ),
      ),
    );
  }
}
