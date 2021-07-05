import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/account/submodules/auth/submodules/signin/signin_widget.dart';
import 'auth_store.dart';
import 'submodules/signup/signup_widget.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends ModularState<AuthPage, AuthStore> {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    final signUp = SignUpWidget();
    final signIn = SignInWidget();

    final optionsMenu = Observer(builder: (_) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          text("Entrar",
                  textColor: controller.isSignIn == true
                      ? color_colorPrimary
                      : textPrimaryColor,
                  fontSize: textSizeLargeMedium,
                  fontFamily: fontBold)
              .paddingAll(spacing_standard_new)
              .onTap(() {
            controller.isSignIn = true;
            controller.isSignUp = false;
          }),
          text("Inscrever-se",
                  textColor: controller.isSignUp == true
                      ? color_colorPrimary
                      : textPrimaryColor,
                  fontSize: textSizeLargeMedium,
                  fontFamily: fontBold)
              .paddingAll(spacing_standard_new)
              .onTap(() {
            controller.isSignIn = false;
            controller.isSignUp = true;
          })
        ],
      );
    });

    return Scaffold(
      backgroundColor: color_app_background,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: spacing_xxLarge,
            ),
            Container(
              width: width,
              decoration: BoxDecoration(
                color: color_white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20.0),
                  bottomRight: const Radius.circular(20.0),
                ),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: color_ShadowColor,
                      blurRadius: 20.0,
                      offset: Offset(0.0, 0.9)),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  optionsMenu,
                  Observer(builder: (_) {
                    return controller.isSignUp ? signUp : signIn;
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
