import 'package:dio/dio.dart';
import 'package:agro_tools/app/core/services/location/location_service.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/modules/account/account_module.dart';
import 'package:agro_tools/app/modules/main/main_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/env/variables.dart';
import 'core/services/notifications/notification_service.dart';
import 'modules/account/repositories/account_repository.dart';
import 'modules/splash/splash_page.dart';

class AppModule extends Module {
  final List<Bind> binds = [
    BindInject((i) => LocationService(), isSingleton: true, isLazy: false),
    BindInject(
      (i) => Dio(BaseOptions(baseUrl: API_ENDPOINT)),
    ),
    BindInject((i) => AccountRepository(i<Dio>())),
    BindInject((i) => UserPreferencesStore(i<AccountRepository>()),
        isSingleton: true, isLazy: false),
    BindInject((i) => NotificationService(), isSingleton: true, isLazy: false),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/splash', child: (_, __) => SplashPage()),
    ModuleRoute(
      '/',
      module: MainModule(),
    ),
    ModuleRoute('/account', module: AccountModule()),
  ];
}
