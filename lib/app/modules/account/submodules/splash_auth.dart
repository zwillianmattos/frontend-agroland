import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/widgets/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: color_colorPrimary,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  text("Bem vindo",
                          textColor: color_white,
                          fontSize: textSizeXXLarge,
                          fontFamily: fontSemibold,
                          isCentered: true,
                          isLongText: true)
                      .paddingOnly(
                          left: spacing_control, right: spacing_control),
                  SizedBox(
                    height: spacing_xxLarge,
                  ),
                  Container(
                      width: width * 0.35,
                      child: appButton2(
                        textContent: "Entrar",
                        onPressed: (() {
                          Modular.to.pushReplacementNamed('/account/auth',
                              arguments: <String, bool>{
                                'signup': false,
                                'signin': true,
                              });
                        }),
                      )),
                  SizedBox(
                    height: spacing_standard,
                  ),
                  FittedBox(
                      child: appButton3(
                    textContent: "Cadastrar",
                    onPressed: (() {
                      Modular.to.pushReplacementNamed('/account/auth',
                          arguments: <String, bool>{
                            'signup': true,
                            'signin': false,
                          });
                    }),
                  ))
                ],
              ).paddingOnly(bottom: spacing_xxLarge),
            )
          ],
        ),
      ),
    );
  }
}
