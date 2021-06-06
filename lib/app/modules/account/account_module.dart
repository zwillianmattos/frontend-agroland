import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/account/page/login_page.dart';
import 'package:plant_care/app/modules/account/page/register_page.dart';

import 'repositories/account_repository.dart';
import 'stores/login_store.dart';

class AccountModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject(
      (i) => AccountRepository(i<Dio>()),
    ),
    BindInject(
      (i) => LoginStore(i<AccountRepository>()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, __) => Container(child: Text("Testa se ta logado"))),
    ChildRoute('/login', child: (_, __) => LoginPage()),
    ChildRoute('/register', child: (_, __) => RegisterPage()),
  ];
}
