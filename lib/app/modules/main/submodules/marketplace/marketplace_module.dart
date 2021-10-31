import 'package:dio/dio.dart';
import 'package:agro_tools/app/core/env/variables.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/pages/announce_view/announce_view_page.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/pages/announce_view/announce_view_store.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/pages/announces/announces_store.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/pages/home/marketplace_home_store.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/pages/search/marketplace_search_page.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/pages/search/marketplace_search_store.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/pages/shop_view/marketplace_view_account_page.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/pages/shop_view/marketplace_view_account_store.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/pages/product_view/marketplace_view_page.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/repositories/marketplace_repository.dart';
import 'pages/announces/announces_page.dart';
import 'pages/home/marketplace_home_page.dart';

class MarketplaceModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject(
      (i) => Dio(BaseOptions(baseUrl: API_ENDPOINT)),
    ),
    BindInject((i) => MarketplaceRepository((i<Dio>()))),
    BindInject((i) => MarketplaceHomeStore(i<MarketplaceRepository>())),
    BindInject((i) => MarketplaceViewAccoutStore(i<MarketplaceRepository>())),
    BindInject((i) => MarketplaceAnnouncesStore(i<MarketplaceRepository>())),
    BindInject((i) => MarketplaceAnnounceViewStore(i<MarketplaceRepository>())),
    BindInject((i) => MarketplaceSearchStore(i<MarketplaceRepository>()))
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
      child: (_, __) => MarketplaceViewAccountPage(),
    ),
    ChildRoute('search', child: (_, __) => MarketplaceSearchPage()),
    ChildRoute(
      '/announces',
      child: (_, __) => MarketplaceAnnouncesPage(),
    ),
    ChildRoute(
      '/announces/new',
      child: (_, __) => MarketplaceAnnounceViewPage(),
    ),
  ];
}
