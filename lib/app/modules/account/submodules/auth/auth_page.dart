import 'package:flutter/cupertino.dart';
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
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'images/logo.png',
          scale: 2.5,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: spacing_xxLarge,
              ),
              Container(
                width: width,
                decoration: BoxDecoration(
                  color: color_white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: const Radius.circular(8.0),
                    topLeft: Radius.circular(8.0),
                    topRight: const Radius.circular(8.0),
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
              SizedBox(
                height: spacing_xxLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
