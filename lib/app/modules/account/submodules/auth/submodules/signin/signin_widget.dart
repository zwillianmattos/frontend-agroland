import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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

    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      child: Observer(builder: (c) {
        return Form(
          key: controller.formKey,
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // text("Faça login no aplicativo",
                //         maxLine: 5, fontSize: textSizeLarge, fontFamily: fontBold)
                //     .paddingOnly(
                //         top: spacing_standard_new,
                //         left: spacing_standard_new,
                //         right: spacing_standard_new),
                // text(
                //   "Digite o email e a senha para continuar",
                //   textColor: textSecondaryColor,
                //   fontSize: textSizeLargeMedium,
                //   maxLine: 5
                // ).paddingOnly(
                //     left: spacing_standard_new, right: spacing_standard_new),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: appEditTextStyle("Email",
                      enableBorder: true,
                      isPassword: false,
                      enableLabel: true,
                      keyboardType: TextInputType.emailAddress,
                      onValidation: (email) {
                    // Simple validator for email
                    if (email == null || email.length == 0) {
                      return "Email nao informado";
                    }

                    // Validate email address
                    bool emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(email);

                    if (!emailValid) {
                      return "Email inválido";
                    }
                  }, onSaved: (text) {
                    controller.user.email = text;
                  }).paddingAll(spacing_standard_new),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: appEditTextStyle("Senha",
                      isPassword: true,
                      enableBorder: true,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      onValidation: (text) {
                    if (text.length > 0 && text.length < 6)
                      return "A senha deve ter no mínimo 6 caracteres";
                    if (text.length > 20)
                      return "A senha deve ter no máximo 20 caracteres";
                    return null;
                  }, onSaved: (text) {
                    controller.user.password = text;
                  }).paddingAll(spacing_standard_new),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: appButton2(
                          radius: 8,
                          textContent: "Entrar",
                          onPressed: (() {
                            controller.signIn();
                          }),
                        ).paddingOnly(
                          bottom:  spacing_standard_new
                        )
                      ),
                    )
                  ],
                ).paddingOnly( left: spacing_standard_new, right:  spacing_standard_new, bottom:  spacing_standard_new),
              ],
            ),
          ),
        );
      }),
    );
  }
}
