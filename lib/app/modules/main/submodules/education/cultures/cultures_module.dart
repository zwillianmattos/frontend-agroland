import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/page/cultures_list_page.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/page/cultures_list_store.dart';

import 'page/culture_detail_page.dart';
import 'page/culture_detail_store.dart';
import 'page/culture_detail_view_page.dart';
import 'page/cultures_category_page.dart';
import 'page/cultures_category_store.dart';
import 'repositories/cultures_repository.dart';

class CulturesModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject((i) => CulturesRepository(i<Dio>())),
    BindInject((i) => CulturesListStore(i<CulturesRepository>())),
    BindInject((i) => CulturesCategoryStore(i<CulturesRepository>())),
    BindInject((i) => CulturesDetailStore(i<CulturesRepository>())),
  ];

  @override
  final List<ModularRoute> routes = [
    // List of cultures
    ChildRoute(Modular.initialRoute, child: (_, __) => CulturesListPage()),
    // List of cultures by category
    ChildRoute(
      '/:culture/categories',
      child: (_, __) => CulturesCategoryPage(),
    ),
    // View culture categories items
    ChildRoute(
      '/:culture/:category/items',
      child: (_, __) => CultureDetailPage(),
    ),
    // View culture categorie item detail
    ChildRoute(
      '/:culture/:category/item/:item/detail',
      child: (_, __) => CultureDetailViewPage(),
    )
  ];
}
