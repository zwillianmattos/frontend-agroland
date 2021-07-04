import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/account/repositories/account_repository.dart';

import 'package:plant_care/app/modules/account/submodules/auth/auth_store.dart';
import 'package:plant_care/app/modules/account/submodules/auth/submodules/signin/signin_store.dart';
import 'package:plant_care/app/modules/account/submodules/auth/submodules/signup/signup_store.dart';
import 'package:plant_care/app/modules/account/submodules/auth/auth_page.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject(
      (i) => AccountRepository(i<Dio>()),
    ),
    BindInject((i) => SignInStore(i<AccountRepository>()), isSingleton: true),
    BindInject((i) => SignUpStore(i<AccountRepository>()), isSingleton: true),
    BindInject(
      (i) => AuthStore(),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => AuthPage()),
  ];
}
