import 'dart:convert';
import 'package:app_inside/app/modules/bible/infra/datasources/book_datasource.dart';
import 'package:app_inside/app/modules/bible/infra/models/book_model.dart';
import 'package:app_inside/app/modules/bible/infra/utils/string_utils.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'bible_datasource.g.dart';

@Injectable(singleton: false)
class BibleDatasource implements BookDatasource {

  BibleDatasource();

  @override
  Future<List<BookModel>?> loadData(String? search) async {

    final String data =
        await rootBundle.loadString("assets/nvi.json");

    final json = jsonDecode(data) as List;

    var list = json
        .map((item) => BookModel(
              name: item['name'],
              chapters: item['chapters'],
              abbrev: item['abbrev'],
            ))
        .toList();

    if (search != null) {
      list = list
          .where((element) => removeDiacritics(element.name)
              .toLowerCase()
              .trim()
              .contains(removeDiacritics(search).toLowerCase().trim()))
          .toList();
    }

    return list;
  }

}
