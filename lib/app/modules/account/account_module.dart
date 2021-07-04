import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/account/submodules/profile/profile_page.dart';
import 'repositories/account_repository.dart';
import 'submodules/auth/auth_module.dart';

class AccountModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(
      '/auth',
      module: AuthModule(),
    ),
    ChildRoute(
      '/profile',
      child: (_, __) => ProfilePage(),
    ),
  ];
}
