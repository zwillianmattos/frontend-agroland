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
    return Container(
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
          appEditTextStyle(
            "Nome",
            isPassword: false,
          ).paddingAll(spacing_standard_new),
          appEditTextStyle(
            "Email",
            isPassword: false,
            keyboardType: TextInputType.emailAddress,
          ).paddingAll(spacing_standard_new),
          appEditTextStyle(
            "Senha",
            isPassword: true,
          ).paddingAll(spacing_standard_new),
          appEditTextStyle("Repetir Senha", isPassword: true,
              onValidation: (text) {
            if (text.length < 6 || text == null || text.length == 0)
              return "A senha deve ter no mínimo 6 caracteres";

            return null;
          }).paddingAll(spacing_standard_new),
          SizedBox(
            height: 10,
          ),
          Align(
              alignment: Alignment.centerRight,
              child: FittedBox(
                child: appButton2(
                  radius: 8,
                  textContent: "Próximo",
                  onPressed: (() {
                    // GroceryAddNumber().launch(context);
                  }),
                ).paddingOnly(
                    right: spacing_standard_new, bottom: spacing_standard_new),
              ))
        ],
      ),
    );
  }
}
