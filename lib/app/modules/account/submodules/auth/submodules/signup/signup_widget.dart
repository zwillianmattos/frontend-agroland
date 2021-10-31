import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/core/consts/colors.dart';
import 'package:agro_tools/app/core/consts/texts.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/account/submodules/auth/submodules/signup/signup_store.dart';
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: text("Seja bem vindo ao AgroTools",
                      fontSize: textSizeLarge, fontFamily: fontBold, maxLine: 5)
                  .paddingOnly(
                      top: spacing_standard_new,
                      left: spacing_standard_new,
                      right: spacing_standard_new),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: text("Vamos começar",
                      textColor: color_textColorSecondary,
                      fontSize: textSizeLargeMedium,
                      fontFamily: fontRegular,
                      maxLine: 5)
                  .paddingOnly(
                      left: spacing_standard_new,
                      right: spacing_standard_new,
                      bottom: spacing_standard_new),
            ),
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
                ConstrainedBox(
                  constraints:
                      const BoxConstraints.tightFor(width: 300, height: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 0,
                        primary: color_colorPrimary,
                        onPrimary: Colors.white,
                        padding:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20))),
                    child: text(
                      'Registrar',
                      textColor: Colors.white,
                    ),
                    onPressed: () {
                      controller.signUp();
                    },
                  ),
                )
              ],
            ).paddingOnly(
                left: spacing_standard_new,
                right: spacing_standard_new,
                bottom: spacing_standard_new),
            SizedBox(
              height: spacing_xxLarge,
            ),
          ],
        ),
      ),
    );
  }
}
