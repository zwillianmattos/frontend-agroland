
import 'package:app_inside/app/modules/bible/domain/usecases/books.dart';
import 'package:app_inside/app/modules/bible/external/bible/bible_datasource.dart';
import 'package:app_inside/app/modules/bible/infra/repositories/bible_repository_impl.dart';
import 'package:app_inside/app/modules/bible/presenter/pages/book_view_page.dart';
import 'package:app_inside/app/modules/bible/presenter/stores/book_view_store.dart';
import 'package:app_inside/app/modules/bible/presenter/stores/books_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'presenter/pages/books_page.dart';

class BibleModule extends Module {
  @override
  final List<Bind> binds = [
    $BibleBooksImpl,
    $BibleDatasource,
    $BibleRepositoryImpl,
    Bind.instance<http.Client>(http.Client()),
    $BooksStore,
    $BookViewStore,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => BooksPage()),
    ChildRoute(
      'book/:book/:chapeter',
      child: (_, args) => BookViewPage(
        chapeter: int.parse(args.params['chapeter']),
        book: args.data,
      ),
    ),
  ];
}
