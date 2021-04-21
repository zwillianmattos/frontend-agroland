
import 'package:app_inside/app/modules/bible/infra/models/book_model.dart';

abstract class BookDatasource {
  Future<List<BookModel>?> loadData(String? search);
}