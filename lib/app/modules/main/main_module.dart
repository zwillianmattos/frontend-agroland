import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/modules/main/submodules/education/cultures/cultures_module.dart';
import 'package:agro_tools/app/modules/main/submodules/home/home_module.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/marketplace_module.dart';
import 'bottom_navigator_store.dart';
import 'bottom_navigator_widget.dart';
import 'submodules/community/community_module.dart';
import 'submodules/configurations/configurations_page.dart';
import 'submodules/education/education_module.dart';
import 'submodules/tools/tools_module.dart';

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
      transition: TransitionType.rightToLeftWithFade,
      children: [
        ModuleRoute('/home',
            module: HomeModule(), transition: TransitionType.fadeIn),
        ModuleRoute('/community',
            module: CommunityModule(), transition: TransitionType.fadeIn),
        ModuleRoute('/marketplace',
            module: MarketplaceModule(), transition: TransitionType.fadeIn),
        ModuleRoute(
          '/education',
          module: EducationModule(),
          transition: TransitionType.fadeIn,
        ),
        ModuleRoute('/cultures',
            module: CulturesModule(), transition: TransitionType.fadeIn),
        ChildRoute(
          '/configurations',
          child: (_, __) => ConfigurationPage(),
        ),
        ModuleRoute('/tools',
            module: ToolsModule(), transition: TransitionType.fadeIn),
      ],
    ),
  ];
}
