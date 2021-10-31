import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:agro_tools/app/core/widgets/widgets.dart';

import 'bottom_navigator_store.dart';

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
                            'images/logo_tcc.png',
                            scale: 2.5,
                          ),
                          DrawerListTile(
                            icon: 'images/home_bulk.svg',
                            store: controller,
                            index: 0,
                            title: 'Início',
                          ),
                          DrawerListTile(
                            icon: 'images/buy_bulk.svg',
                            store: controller,
                            index: 1,
                            title: 'Loja',
                          ),
                          DrawerListTile(
                            icon: 'images/message_bulk.svg',
                            store: controller,
                            index: 2,
                            title: 'Comunidade',
                          ),
                          DrawerListTile(
                            icon: 'images/user_bulk_black.svg',
                            store: controller,
                            index: 4,
                            title: 'Minha Conta',
                          ),
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
                              enableFeedback: true,
                              elevation: 10.0,
                              items: <BottomNavigationBarItem>[
                                BottomNavigationBarItem(
                                  icon: PlatformSvg.asset(
                                    "images/home_bulk.svg",
                                    context: context,
                                  ),
                                  label: 'Início',
                                ),
                                BottomNavigationBarItem(
                                  icon: PlatformSvg.asset(
                                    "images/buy_bulk.svg",
                                    context: context,
                                  ),
                                  label: 'Loja',
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
