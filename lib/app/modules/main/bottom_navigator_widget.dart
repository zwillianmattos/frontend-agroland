import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:fluttericon/typicons_icons.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:plant_care/app/core/consts/colors.dart';

import 'package:flutter_modular/flutter_modular.dart';
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
        backgroundColor: Colors.white,
        body: RouterOutlet(),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Typicons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Typicons.users),
              label: 'Comunidade',
            ),
            BottomNavigationBarItem(
              icon: Icon(Typicons.bookmark),
              label: 'Cursos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Typicons.cog),
              label: 'Settings',
            ),
          ],
          currentIndex: controller.currentIndex,
          selectedItemColor: color_colorPrimary,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black,
          onTap: controller.changePage,
        ),
      );
    });
  }
}
