import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/account/submodules/auth/submodules/signin/signin_store.dart';
import 'package:nb_utils/nb_utils.dart';

class SignInWidget extends StatefulWidget {
  @override
  _SignInWidgetState createState() => _SignInWidgetState();
}

class _SignInWidgetState extends ModularState<SignInWidget, SignInStore> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          text("Faça login no aplicativo",
                  maxLine: 5, fontSize: textSizeLarge, fontFamily: fontBold)
              .paddingOnly(
                  top: spacing_standard_new,
                  left: spacing_standard_new,
                  right: spacing_standard_new),
          text(
            "Digite o email e a senha para continuar",
            textColor: textSecondaryColor,
            fontSize: textSizeLargeMedium,
          ).paddingOnly(
              left: spacing_standard_new, right: spacing_standard_new),
          appEditTextStyle(
            "Email",
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
          ).paddingAll(spacing_standard_new),
          appEditTextStyle("Senha",
                  isPassword: true,
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done)
              .paddingAll(spacing_standard_new),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              text(
                "Esqueci a senha",
                fontSize: textSizeLargeMedium,
                fontFamily: fontMedium,
              )
                  .paddingOnly(
                      left: spacing_standard_new,
                      right: spacing_standard_new,
                      bottom: spacing_standard_new)
                  .onTap(() {}),
              appButton2(
                textContent: "Entrar",
                onPressed: (() {
                  Modular.to.pushReplacementNamed('/');
                }),
              )
                  .paddingOnly(
                      right: spacing_standard_new, bottom: spacing_standard_new)
                  .paddingOnly(
                      top: spacing_standard_new, bottom: spacing_standard_new)
            ],
          )
        ],
      ),
    );
  }
}
