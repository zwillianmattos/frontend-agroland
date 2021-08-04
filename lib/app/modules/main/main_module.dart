import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/cultures_module.dart';
import 'package:plant_care/app/modules/main/submodules/home/home_module.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/marketplace_module.dart';
import 'bottom_navigator_store.dart';
import 'bottom_navigator_widget.dart';
import 'submodules/community/community_module.dart';
import 'submodules/configurations/configurations_page.dart';
import 'submodules/education/education_module.dart';

class MainModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject((i) => BottomNavigatorStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Modular.initialRoute,
      child: (_, __) => BottomNavigatorPage(),
      children: [
        ModuleRoute('/home', module: HomeModule()),
        ModuleRoute('/community', module: CommunityModule()),
        ModuleRoute('/education', module: EducationModule()),
        ModuleRoute('/marketplace', module: MarketplaceModule()),
        ModuleRoute('/cultures', module: CulturesModule()),
        ChildRoute('/configurations', child: (_, __) => ConfigurationPage()),
      ],
    ),
  ];
}
