import 'package:dio/dio.dart';
import 'package:plant_care/app/core/env/variables.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/pages/marketplace_home_store.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/pages/marketplace_view_account_page.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/pages/marketplace_view_page.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/repositories/marketplace_repository.dart';
import './pages/marketplace_home_page.dart';

class MarketplaceModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject(
      (i) => Dio(BaseOptions(baseUrl: API_ENDPOINT)),
    ),
    BindInject((i) => MarketplaceRepository((i<Dio>()))),
    BindInject((i) => MarketplaceHomeStore(i<MarketplaceRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => MarketplaceHomePage()),
    ChildRoute(
      '/view',
      child: (_, __) => MarketplaceClassificadoViewPage(
        classificado: __.data,
      ),
    ),
    ChildRoute(
      '/account',
      child: (_, __) => MarketplaceViewAccountPage(
        logista: __.data,
      ),
    )
  ];
}
