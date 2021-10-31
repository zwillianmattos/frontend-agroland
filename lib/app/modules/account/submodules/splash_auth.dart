import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/consts/colors.dart';
import 'package:agro_tools/app/core/consts/texts.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    //SystemChrome.setEnabledSystemUIOverlays([]);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "images/background_plants.jpg",
            ),
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Image.asset(
                'images/logo_tcc4.png',
                // width: width * 0.6,
                height: width * 0.2,
                fit: BoxFit.contain,
              ).center(),
              Padding(
                padding: const EdgeInsets.all(spacing_standard_new),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    SizedBox(
                      height: spacing_xxLarge,
                    ),
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints.tightFor(width: 300, height: 50),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: color_colorPrimary,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: text(
                          'Entrar',
                          textColor: color_colorPrimary,
                        ),
                        onPressed: () {
                          Modular.to.pushNamed('/account/auth/usr',
                              arguments: <String, bool>{
                                'signup': false,
                                'signin': true,
                              });
                        },
                      ),
                    ),
                    SizedBox(
                      height: spacing_standard_new,
                    ),
                    ConstrainedBox(
                      constraints:
                          const BoxConstraints.tightFor(width: 300, height: 50),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: color_colorPrimary,
                            onPrimary: Colors.white,
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 10),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        child: text(
                          'Cadastrar',
                          textColor: Colors.white,
                        ),
                        onPressed: () {
                          Modular.to.pushNamed('/account/auth/usr',
                              arguments: <String, bool>{
                                'signup': true,
                                'signin': false,
                              });
                        },
                      ),
                    ),
                  ],
                ).paddingOnly(bottom: spacing_xxLarge),
              )
            ],
          ),
        ),
      ),
    );
  }
}
