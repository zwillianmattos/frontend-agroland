import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/widgets/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Cadastro",
            fontSize: textSizeLargeMedium, fontFamily: fontMedium),
        leading: Icon(
          Icons.arrow_back,
          color: color_colorPrimary,
          size: 30,
        ).onTap(() {
          Navigator.of(context).pop();
        }),
        centerTitle: true,
        backgroundColor: color_app_background,
        elevation: 0.0,
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: color_app_background,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.only(
                      left: 24.0, right: 24.0, top: 5.0, bottom: 5),
                  child: text("Cadastrar",
                      fontSize: textSizeXXLarge, fontFamily: fontBold),
                ),
                Container(
                    margin: EdgeInsets.only(
                        left: 24.0, right: 24.0, top: 5.0, bottom: 5),
                    child: appEditTextStyle("Nome", isPassword: false)),
                Container(
                    margin: EdgeInsets.only(
                        left: 24.0, right: 24.0, top: 5.0, bottom: 5),
                    child: appEditTextStyle("Email", isPassword: false)),
                Container(
                    margin: EdgeInsets.only(
                        left: 24.0, right: 24.0, top: 5.0, bottom: 5),
                    child: appEditTextStyle("Senha", isPassword: true)),
                Container(
                    margin: EdgeInsets.only(
                        left: 24.0, right: 24.0, top: 5.0, bottom: 5),
                    child: appEditTextStyle("Repetir senha", isPassword: true)),
                SizedBox(height: 10),
                Container(
                  margin: EdgeInsets.all(24.0),
                  child: appButton(
                    textContent: "Cadastrar",
                    onPressed: () {
                      Modular.to.pushReplacementNamed('/dashboard');
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
