import 'package:app_inside/app/modules/bible/domain/entities/book.dart';
import 'package:app_inside/app/modules/bible/domain/errors/erros.dart';
import 'package:app_inside/app/modules/bible/domain/usecases/books.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';

part 'books_store.g.dart';

@Injectable()
class BooksStore extends MobXStore<Failure, List<Book>> {
  final BibleBooks bibleBooks;

  BooksStore(this.bibleBooks) : super([]) {
    this.loadData();
  }

  void loadData({String searchBook = ''}) async {

    executeEither(() => bibleBooks(searchBook),
        delay: Duration(milliseconds: 500));
  }
}
