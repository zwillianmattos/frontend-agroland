import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/consts/texts.dart';
import 'package:plant_care/app/core/models/account.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/account/submodules/auth/auth_store.dart';
import 'package:plant_care/app/modules/main/submodules/community/community_module.dart';
import 'package:relative_scale/relative_scale.dart';

import 'bottom_navigator_store.dart';
import 'submodules/home/page/home_page.dart';

import 'package:universal_io/io.dart' as IO;

class BottomNavigatorPage extends StatefulWidget {
  @override
  BottomNavigatorPageState createState() => BottomNavigatorPageState();
}

class BottomNavigatorPageState
    extends ModularState<BottomNavigatorPage, BottomNavigatorStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      AccountModel? accountModel =
          Modular.get<UserPreferencesStore>().accountModel;

      controller.checkScreenSize(context);

      return Row(
        children: [
          if (!(!IO.Platform.isAndroid || !IO.Platform.isIOS) ||
              !controller.isMobile)
            Drawer(
              elevation: 0,
              child: Container(
                // color: color_app_background,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.zero,
                        children: [
                          Image.asset(
                            'images/logo.png',
                            scale: 2.5,
                          ),
                          DrawerListTile(
                            icon: 'images/home_bulk.svg',
                            store: controller,
                            index: 0,
                            title: 'Home',
                          ),
                          DrawerListTile(
                            icon: 'images/buy_bulk.svg',
                            store: controller,
                            index: 1,
                            title: 'Marketplace',
                          ),
                          DrawerListTile(
                            icon: 'images/message_bulk.svg',
                            store: controller,
                            index: 2,
                            title: 'Comunidade',
                          ),
                          DrawerListTile(
                            icon: 'images/folder_bulk_black.svg',
                            store: controller,
                            index: 3,
                            title: 'Educação',
                          ),
                          DrawerListTile(
                            icon: 'images/user_bulk_black.svg',
                            store: controller,
                            index: 4,
                            title: 'Minha Conta',
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.all(16.0),
                          //   child: ListTile(
                          //     leading: PlatformSvg.asset(
                          //       "images/buy_bulk.svg",
                          //       context: context,
                          //     ),
                          //     title:
                          //         text('Marketplace', fontFamily: fontRegular),
                          //     onTap: () {
                          //       controller.changePage(1);
                          //     },
                          //     selected:
                          //         controller.currentPage == 1 ? true : false,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(16.0),
                          //   child: ListTile(
                          //     leading: PlatformSvg.asset(
                          //       "images/message_bulk.svg",
                          //       context: context,
                          //     ),
                          //     title:
                          //         text('Comunidade', fontFamily: fontRegular),
                          //     onTap: () {
                          //       controller.changePage(2);
                          //     },
                          //     selected:
                          //         controller.currentPage == 2 ? true : false,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(16.0),
                          //   child: ListTile(
                          //     leading: PlatformSvg.asset(
                          //       "images/folder_bulk_black.svg",
                          //       context: context,
                          //     ),
                          //     title: text('Educação', fontFamily: fontRegular),
                          //     onTap: () {
                          //       controller.changePage(3);
                          //     },
                          //     selected:
                          //         controller.currentPage == 3 ? true : false,
                          //   ),
                          // ),
                          // Padding(
                          //   padding: const EdgeInsets.all(16.0),
                          //   child: ListTile(
                          //     leading: PlatformSvg.asset(
                          //       "images/user_bulk_black.svg",
                          //       context: context,
                          //     ),
                          //     title:
                          //         text('Minha Conta', fontFamily: fontRegular),
                          //     onTap: () {
                          //       controller.changePage(4);
                          //     },
                          //     selected:
                          //         controller.currentPage == 4 ? true : false,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                    const VerticalDivider(
                      width: 1,
                    )
                  ],
                ),
              ),
            ),
          Expanded(
            child: Scaffold(
              extendBody: false,
              // backgroundColor: Colors.transparent,
              // appBar: AppBar(
              //   elevation: 0,
              //   backgroundColor: color_app_background,
              //   centerTitle: true,
              //   title: Image.asset(
              //     'images/logo.png',
              //     scale: 2.5,
              //   ),
              // ),
              body: RouterOutlet(),
              bottomNavigationBar:
                  (IO.Platform.isAndroid || IO.Platform.isIOS) ||
                          controller.isMobile
                      ? ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12),
                          ),
                          child: Observer(builder: (_) {
                            return BottomNavigationBar(
                              elevation: 10.0,
                              items: <BottomNavigationBarItem>[
                                BottomNavigationBarItem(
                                  icon: PlatformSvg.asset(
                                    "images/home_bulk.svg",
                                    context: context,
                                  ),
                                  label: 'Home',
                                ),
                                BottomNavigationBarItem(
                                  icon: PlatformSvg.asset(
                                    "images/buy_bulk.svg",
                                    context: context,
                                  ),
                                  label: 'Marketplace',
                                ),
                                BottomNavigationBarItem(
                                  icon: PlatformSvg.asset(
                                    "images/message_bulk.svg",
                                    context: context,
                                  ),
                                  label: 'Comunidade',
                                ),
                                BottomNavigationBarItem(
                                  icon: PlatformSvg.asset(
                                    "images/folder_bulk_black.svg",
                                    context: context,
                                  ),
                                  label: 'Educação',
                                ),
                                BottomNavigationBarItem(
                                  icon: PlatformSvg.asset(
                                    "images/user_bulk_black.svg",
                                    context: context,
                                  ),
                                  label: 'Minha Conta',
                                ),
                              ],
                              currentIndex: controller.currentPage,
                              selectedItemColor:
                                  Theme.of(context).colorScheme.secondary,
                              unselectedItemColor:
                                  Theme.of(context).secondaryHeaderColor,
                              onTap: controller.changePage,
                            );
                          }),
                        )
                      : null,
            ),
          ),
        ],
      );
    });
  }
}
