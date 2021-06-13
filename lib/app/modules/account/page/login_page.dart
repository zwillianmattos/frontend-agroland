import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/colors.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/interfaces/user_interface.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:plant_care/app/modules/account/stores/login_store.dart';
import 'package:plant_care/app/widgets/widgets.dart';
import 'package:nb_utils/nb_utils.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginStore> {
  final GlobalKey<FormState> _form = new GlobalKey<FormState>();

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screen = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: color_app_background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    SizedBox(height: 25),
                    Image.asset(
                      'images/logo.png',
                      scale: 10,
                    ),
                    SizedBox(height: 25),
                  ],
                ),
              ),
              Container(
                // height: screen.height,
                decoration: BoxDecoration(
                    // color: color_light_gray,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(22),
                        topRight: Radius.circular(22))),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 16),
                      SizedBox(height: 16),
                      Form(
                        key: _form,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                  left: 24.0, right: 24.0, top: 5.0, bottom: 5),
                              child: text("Entrar",
                                  fontSize: textSizeXXLarge,
                                  fontFamily: fontBold),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 24.0, right: 24.0, top: 5.0, bottom: 5),
                              decoration: boxDecoration(
                                  bgColor: color_edit_background,
                                  color: color_edit_background,
                                  showShadow: false,
                                  radius: 4),
                              child: Column(
                                children: <Widget>[
                                  appEditTextStyle("Email", isPassword: false,
                                      onValidation: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some email';
                                    }
                                    return null;
                                  }, controller: emailController),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(
                                  left: 24.0, right: 24.0, top: 5.0, bottom: 5),
                              decoration: boxDecoration(
                                  bgColor: color_edit_background,
                                  color: color_edit_background,
                                  showShadow: false,
                                  radius: 4),
                              child: Column(
                                children: <Widget>[
                                  appEditTextStyle("Senha", onSaved: (value) {},
                                      onValidation: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some password';
                                    }
                                    return null;
                                  }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(24.0),
                          child: appButton(
                              textContent: "Entrar", onPressed: _loginBtn)),
                      SizedBox(height: 10),
                      Container(
                        margin: EdgeInsets.all(24.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            text("nao tenho conta ?"),
                            text("criar conta",
                                textColor: color_colorPrimary,
                                fontFamily: fontSemibold),
                          ],
                        ),
                      ).onTap(() {
                        Modular.to.pushNamed('/account/register');
                      }),
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }

  void _loginBtn() async {
    if (_form.currentState!.validate()) {
      await controller.login(new User(
          email: emailController.text, password: passwordController.text));
    }
  }
}
