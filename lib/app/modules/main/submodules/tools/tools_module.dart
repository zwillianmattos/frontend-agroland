import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/tools/ui/home_view.dart';

class ToolsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => HomeView()),
  ];
}
