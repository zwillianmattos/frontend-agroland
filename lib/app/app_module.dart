import 'package:dio/dio.dart';
import 'package:plant_care/app/core/services/location/location_service.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:plant_care/app/modules/account/account_module.dart';
import 'package:plant_care/app/modules/main/main_module.dart';
import 'package:plant_care/app/modules/splash/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/env/variables.dart';
import 'modules/account/repositories/account_repository.dart';

class AppModule extends Module {
  final List<Bind> binds = [
    BindInject(
      (i) => Dio(BaseOptions(baseUrl: API_ENDPOINT)),
    ),
    BindInject((i) => AccountRepository(i<Dio>())),
    BindInject((i) => UserPreferencesStore(i<AccountRepository>()),
        isSingleton: true, isLazy: false),
    BindInject((i) => LocationService()),
  ];

  @override
  final List<ModularRoute> routes = [
    // ChildRoute('/splash', child: (_, __) => SplashPage()),
    ModuleRoute('/', module: MainModule()),
    ModuleRoute('/account', module: AccountModule()),
  ];
}
