import 'package:app_inside/app/modules/bible/bible_module.dart';
import 'package:app_inside/app/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {

  @override
  final List<ModularRoute> routes = [
      ChildRoute(Modular.initialRoute, child: (_, __) => SplashPage()),
      ModuleRoute('/bible', module: BibleModule())
  ];

}