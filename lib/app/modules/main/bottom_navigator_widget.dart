import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/widgets/widgets.dart';
import 'package:plant_care/app/modules/main/submodules/community/community_module.dart';
import 'package:relative_scale/relative_scale.dart';

import 'bottom_navigator_store.dart';
import 'submodules/home/page/home_page.dart';

class BottomNavigatorPage extends StatefulWidget {
  @override
  BottomNavigatorPageState createState() => BottomNavigatorPageState();
}

class BottomNavigatorPageState
    extends ModularState<BottomNavigatorPage, BottomNavigatorStore> {
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      return Scaffold(
        extendBody: true,
        backgroundColor: Colors.transparent,
        body: RouterOutlet(),
        bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: BottomNavigationBar(
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
            ],
            currentIndex: controller.currentPage,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.black,
            onTap: controller.changePage,
          ),
        ),
      );
    });
  }
}
