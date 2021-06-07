import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'page/ebook_page.dart';

import './repositories/ebook_repository.dart';
import './page/ebook_page_store.dart';
import './page/ebook_view_page.dart';

class EbookModule extends Module {
  @override
  final List<Bind> binds = [
    BindInject((i) => EbookRepository(i<Dio>())),
    BindInject((i) => EbookPageStore(i<EbookRepository>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => EbookPage()),
    ChildRoute('view/:id', child: (_, __) => EbookViewPage(
      ebook: __.data,
    )),
  ];
}
