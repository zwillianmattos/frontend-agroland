import 'package:app_inside/app/modules/bible/domain/errors/erros.dart';
import 'package:app_inside/app/modules/bible/domain/entities/book.dart';
import 'package:app_inside/app/modules/bible/domain/repositories/bible_repository.dart';
import 'package:app_inside/app/modules/bible/infra/datasources/book_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'bible_repository_impl.g.dart';

@Injectable(singleton: false)
class BibleRepositoryImpl implements BibleRepository {
  final BookDatasource datasource;

  BibleRepositoryImpl(this.datasource);
  @override
  Future<Either<Failure, List<Book>>> getBible( String? search) async {
    try {
      final list = await datasource.loadData(search);
      
      if (list == null) {
        return Left<Failure, List<Book>>(DatasourceResultNull());
      }
      if (list.isEmpty) {
        return Left(EmptyList());
      }

      return Right<Failure, List<Book>>(list);
    } catch (e) {
      print(e);
      return Left<Failure, List<Book>>(ErrorBible());
    }
  }

}
