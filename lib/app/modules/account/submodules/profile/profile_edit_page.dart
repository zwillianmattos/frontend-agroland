import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:agro_tools/app/core/consts/texts.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/account/submodules/profile/profile_edit_store.dart';

class ProfileEditPage extends StatefulWidget {
  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState
    extends ModularState<ProfileEditPage, ProfileEditStore> {
  @override
  Widget build(BuildContext context) {
    final profilePhoto = Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              elevation: spacing_standard_new,
              margin: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              child: Observer(builder: (_) {
                if( controller.isLoading ) {
                  return SizedBox(
                    height: 95,
                  width: 95,
                    child: Center(child: CircularProgressIndicator(),));
                }
                return Image.network(
                  controller.userPhotoUrl!,
                  height: 95,
                  width: 95,
                  fit: BoxFit.cover,
                );
              }),
            ).onTap(() {
              controller.uploadPhoto();
            }),
            text(
              "Trocar foto",
            ).paddingTop(spacing_standard_new).onTap(() {
              controller.uploadPhoto();
            })
          ],
        ).paddingOnly(top: 16));

    return Observer(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          leading: BackButton(),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: controller.account == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        profilePhoto,
                        Form(
                          key: controller.formKey,
                            child: Column(children: <Widget>[
                          formField(
                            context,
                            "Email",
                            onSaved: (String? value) {
                              controller.account?.email = value;
                            },
                            suffixIcon: Icons.mail_outline,
                            isEnabled: false,
                            initialValue: controller.account?.email
                          ).paddingBottom(spacing_standard_new),
                          formField(
                            context,
                            "Senha",
                            onSaved: (String? value) {
                              controller.account?.password = value;
                            },
                            suffixIcon: Icons.mail_outline,
                          ).paddingBottom(spacing_standard_new),
                        ])).paddingOnly(
                            left: spacing_standard_new,
                            right: spacing_standard_new,
                            top: 36),
                        Container(),
                        SizedBox(
                          width: double.infinity,
                          child: appButton(
                            textContent: "Salvar",
                            onPressed: () {
                              // controller.updateAccount();
                            },
                          ).paddingOnly(
                              top: 30, left: 18, right: 18, bottom: 30),
                        )
                      ],
                    ),
                  ),
                ],
              ),
      );
    });
  }
}
