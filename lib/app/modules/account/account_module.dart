import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/env/variables.dart';
import 'package:plant_care/app/modules/account/submodules/producer_user/producer_user_register_store.dart';
import 'package:plant_care/app/modules/account/submodules/producer_user/repositories/producer_user_repository.dart';
import 'package:plant_care/app/modules/account/submodules/profile/profile_page.dart';
import 'package:plant_care/app/modules/account/submodules/profile/profile_store.dart';
import 'repositories/account_repository.dart';
import 'submodules/auth/auth_module.dart';
import 'submodules/producer_user/register_page.dart';
import 'submodules/profile/profile_edit_page.dart';
import 'submodules/profile/profile_edit_store.dart';

class AccountModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject(
      (i) => AccountRepository(new Dio(BaseOptions(baseUrl: API_ENDPOINT))),
    ),
    BindInject((i) => ProducerUserRepository(i<Dio>())),
    BindInject(
      (i) => ProducerUserRegisterStore(i<ProducerUserRepository>()),
    ),
    BindInject(
      (i) => ProfileEditStore(i<AccountRepository>()),
    ),
    BindInject(
      (i) => ProfileStore(i<AccountRepository>()),
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
      '/profile/edit',
      child: (_, __) => ProfileEditPage(),
    ),
    ChildRoute(
      '/producer_user/register',
      child: (_, __) => ProducerUserRegisterPage(),
    ),
  ];
}
