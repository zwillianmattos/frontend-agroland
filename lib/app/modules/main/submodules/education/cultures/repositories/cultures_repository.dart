import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/culture.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/cultures_categories_rels.dart';

part 'cultures_repository.g.dart';

@Injectable(singleton: false)
class CulturesRepository extends Disposable with Store {
  final Dio _http;

  CulturesRepository(this._http);

  @override
  void dispose() {}

  Future<List<Culture>?> getCultures() async {
    try {
      List<Culture> listData = [];
      Response response = await _http.get('/cultures',
          options: await Modular.get<UserPreferencesStore>().authHeader);

      if (response.statusCode != 200) throw Error();

      var jsonResponse = response.data;

      List<dynamic> list = jsonResponse;
      if (list != null) {
        list.asMap().forEach((key, value) {
          listData.add(Culture.fromJson(value));
        });
      }

      return listData;
    } catch (e) {
      print(e);
    }
  }

  Future<Culture?> getCultureCategories({
    required cultureId,
  }) async {
    try {
      List<Culture> listData = [];
      Response response = await _http.get('/cultures/$cultureId',
          options: await Modular.get<UserPreferencesStore>().authHeader);

      if (response.statusCode != 200) throw Error();

      var jsonResponse = response.data;
      return Culture.fromJson(jsonResponse[0]);
    } catch (e) {
      print(e);
    }
  }

  Future<CulturesCategoriesRels?> getCultureCategorieDetail({
    required cultureId,
    required categorieId,
  }) async {
    try {
      List<Culture> listData = [];
      Response response = await _http.get('/cultures/$cultureId/$categorieId/detail',
          options: await Modular.get<UserPreferencesStore>().authHeader);

      if (response.statusCode != 200) throw Error();

      var jsonResponse = response.data;
      return CulturesCategoriesRels.fromJson(jsonResponse[0]);
    } catch (e) {
      print(e);
    }
  }
}
