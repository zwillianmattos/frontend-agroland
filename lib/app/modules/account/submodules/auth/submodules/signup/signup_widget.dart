import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/account/submodules/auth/submodules/signup/signup_store.dart';
import 'package:nb_utils/nb_utils.dart';

class SignUpWidget extends StatefulWidget {
  @override
  _SignUpWidgetState createState() => _SignUpWidgetState();
}

class _SignUpWidgetState extends ModularState<SignUpWidget, SignUpStore> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // text("Bem-vindo ao PlantCare",
            //         fontSize: textSizeLarge, fontFamily: fontBold, maxLine: 5)
            //     .paddingOnly(
            //         top: spacing_standard_new,
            //         left: spacing_standard_new,
            //         right: spacing_standard_new),
            // text("Vamos começar",
            //         textColor: color_textColorSecondary,
            //         fontSize: textSizeLargeMedium,
            //         fontFamily: fontRegular, maxLine: 5)
            //     .paddingOnly(
            //         left: spacing_standard_new, right: spacing_standard_new),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: appEditTextStyle(
                "Nome",
                isPassword: false,
                onSaved: (text) {
                  controller.user.name = text;
                },
                onValidation: (text) {
                  // Check name is null
                  if (text == null || text.length == 0) return "Nome inválido";
                },
              ).paddingAll(spacing_standard_new),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: appEditTextStyle(
                "Email",
                isPassword: false,
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
                },
                onSaved: (text) {
                  controller.user.email = text;
                },
              ).paddingAll(spacing_standard_new),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: appEditTextStyle(
                "Senha",
                isPassword: true,
                onValidation: (text) {
                  if (text.length < 6 || text == null || text.length == 0)
                    return "A senha deve ter no mínimo 6 caracteres";

                  return null;
                },
                onSaved: (text) {
                  controller.user.password = text;
                },
              ).paddingAll(spacing_standard_new),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: appEditTextStyle(
                "Repetir Senha",
                isPassword: true,
                onValidation: (text) {
                  if (text.length < 6 || text == null || text.length == 0)
                    return "A senha deve ter no mínimo 6 caracteres";

                  return null;
                },
              ).paddingAll(spacing_standard_new),
            ),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: appButton2(
                          radius: 8,
                          textContent: "Registrar",
                          onPressed: (() {
                            controller.signUp();
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
  }
}
