import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/modules/main/submodules/tools/home_view.dart';
import 'package:agro_tools/app/modules/main/submodules/tools/plant_diseases/camera_stream.dart';

class ToolsModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => HomeView()),
    //ChildRoute(Modular.initialRoute, child: (_, __) => CameraStream()),
  ];
}
