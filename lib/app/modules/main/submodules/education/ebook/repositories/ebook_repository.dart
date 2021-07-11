import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import '../models/ebook_model.dart';

part 'ebook_repository.g.dart';

abstract class EbookDatasource {
  Future<List<Ebook>?> load();
  Future<List<Ebook>?> store();
  Future<List<Ebook>?> delete();
}

@Injectable(singleton: false)
class EbookRepository with Store implements EbookDatasource {
  final Dio _http;

  EbookRepository(this._http);

  @override
  void dispose() {}

  @override
  Future<List<Ebook>?> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Ebook>?> load({
    query: ""
  }) async {
    List<Ebook> listaEbooks = [];
    try {
      Response response = await _http.get('/ebooks$query',
          options: await Modular.get<UserPreferencesStore>().authHeader
          );

      if (response.statusCode != 200) throw Error();

      print(response.realUri);
      var jsonResponse = response.data;

      List<dynamic> list = jsonResponse['data']['items'];
      if (list != null) {
        list.asMap().forEach((key, value) {
          listaEbooks.add(Ebook.fromJson(value));
        });
      }
    } catch (e) {
      print(e);
    }

    return listaEbooks;
  }

  @override
  Future<List<Ebook>?> store() {
    // TODO: implement store
    throw UnimplementedError();
  }
}
