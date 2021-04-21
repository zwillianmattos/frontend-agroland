import 'package:app_inside/app/modules/bible/domain/entities/book.dart';
import 'package:app_inside/app/modules/bible/domain/repositories/bible_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../errors/erros.dart';
part 'books.g.dart';

mixin BibleBooks {
  Future<Either<Failure, List<Book>>> call(String? search);
}

@Injectable(singleton: false)
class BibleBooksImpl implements BibleBooks {
  final BibleRepository repository;
  
  BibleBooksImpl(this.repository);

  @override
  Future<Either<Failure, List<Book>>> call(String? search) async {
    return repository.getBible(search);
  }
}
