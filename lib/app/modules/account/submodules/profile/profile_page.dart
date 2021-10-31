import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:agro_tools/app/core/consts/colors.dart';
import 'package:agro_tools/app/core/consts/texts.dart';
import 'package:agro_tools/app/core/models/account.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/core/widgets/widgets.dart';
import 'package:agro_tools/app/modules/account/models/user.dart';
import 'package:agro_tools/app/modules/account/submodules/profile/profile_store.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends ModularState<ProfilePage, ProfileStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Observer(
        builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.only(
                    left: spacing_standard_new,
                    top: spacing_standard_new,
                    right: 12,
                    bottom: spacing_standard_new),
                child: InkWell(
                  onTap: () async {
                    await Modular.to.pushNamed('/account/profile/edit');
                    await controller.refresh();
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      ClipOval(
                        child: networkImage(
                          controller.userPhotoUrl,
                          aWidth: 48.0,
                          aHeight: 48.0,
                        ),
                      ).paddingRight(spacing_standard_new),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            text(
                              controller.account!.name!,
                              fontSize: textSizeNormal,
                              fontFamily: fontBold,
                            ),
                            text(controller.account!.email!,
                                fontSize: textSizeSmall,
                                fontFamily: fontMedium,)
                          ],
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 16,
                        color: Modular.get<UserPreferencesStore>().darkTheme
                            ? color_white
                            : blackColor,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      itemSubTitle(context, "Configurações", colorThird: false)
                          .paddingOnly(
                              left: spacing_standard_new,
                              right: spacing_standard_new,
                              top: 12,
                              bottom: 12),
                      subType(context, "Configurações de Conta", () {
                        // AccountSettingsScreen().launch(context);
                      },
                          Icon(
                            Icons.settings,
                            color: Modular.get<UserPreferencesStore>().darkTheme
                                ? color_white
                                : blackColor,
                          )),
                      Row(
                        children: <Widget>[
                          Icon(
                            CupertinoIcons.moon_stars,
                            color: Modular.get<UserPreferencesStore>().darkTheme
                                ? color_white
                                : blackColor,
                          ).paddingRight(spacing_standard),
                          Expanded(child: itemTitle(context, "Modo escuro")),
                          Theme(
                            data: Theme.of(context).copyWith(
                              unselectedWidgetColor: color_textColorPrimary,
                            ),
                            child: Checkbox(
                              activeColor: color_colorPrimary,
                              checkColor: color_app_background,
                              value:
                                  Modular.get<UserPreferencesStore>().darkTheme,
                              onChanged: (value) {
                                Modular.get<UserPreferencesStore>().darkMode();
                              },
                            ),
                          )
                        ],
                      )
                          .paddingOnly(
                              left: spacing_standard_new,
                              right: spacing_control,
                              top: spacing_control,
                              bottom: spacing_control)
                          .onTap(() {
                        Modular.get<UserPreferencesStore>().darkMode();
                      }),
                      subType(
                          context,
                          "Linguagem",
                          () {},
                          Icon(
                            Icons.language,
                            color: Modular.get<UserPreferencesStore>().darkTheme
                                ? color_white
                                : blackColor,
                          )),
                      subType(context, "Ajuda", () {
                        // HelpScreen().launch(context);
                      },
                          Icon(
                            Icons.help,
                            color: Modular.get<UserPreferencesStore>().darkTheme
                                ? color_white
                                : blackColor,
                          )),
                      itemSubTitle(context, "Termos").paddingOnly(
                          left: spacing_standard_new,
                          right: 12,
                          top: spacing_standard_new,
                          bottom: spacing_control),
                      subType(context, "Termos e Condições", () {
                        // TermsConditionsScreen().launch(context);
                      }, null),
                      subType(context, "Política De Privacidade", () {
                        // TermsConditionsScreen().launch(context);
                      }, null),
                      subType(context, "Sair", () {
                        Modular.get<UserPreferencesStore>().logOff();
                      }, null),
                    ],
                  ).paddingBottom(spacing_large),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
