import 'package:app_inside/app/modules/bible/domain/entities/book.dart';
import 'package:app_inside/app/modules/bible/domain/errors/erros.dart';
import 'package:dartz/dartz.dart';

abstract class BibleRepository {
  Future<Either<Failure, List<Book>>> getBible(String? search);
}
