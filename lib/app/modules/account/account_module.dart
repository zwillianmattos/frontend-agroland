import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/account/submodules/producer_user/producer_user_register_store.dart';
import 'package:plant_care/app/modules/account/submodules/producer_user/repositories/producer_user_repository.dart';
import 'package:plant_care/app/modules/account/submodules/profile/profile_page.dart';
import 'repositories/account_repository.dart';
import 'submodules/auth/auth_module.dart';
import 'submodules/producer_user/register_page.dart';

class AccountModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject((i) => ProducerUserRepository(i<Dio>())),
    BindInject(
      (i) => ProducerUserRegisterStore(i<ProducerUserRepository>()),
    ),
  ];

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
    ChildRoute(
      '/producer_user/register',
      child: (_, __) => ProducerUserRegisterPage(),
    ),
  ];
}
