import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/models/rating.dart';

part 'rating_repository.g.dart';

abstract class RatingDatasource {
  Future<Rating?> rate(Rating rating, int ebookId);
}

@Injectable(singleton: false)
class RatingRepository with Store implements RatingDatasource {
  final Dio _http;

  RatingRepository(this._http);

  @override
  Future<Rating?> rate(Rating rating, dynamic ebookId) async {
    try {
      Response response = await _http.post('/ebooks/$ebookId/rate',
          options: await Modular.get<UserPreferencesStore>().authHeader,
          data: rating.toJson());
      if (response.statusCode == 200) {
        return Rating.fromJson(response.data['data']);
      } else {
        return null;
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 400) {
        EasyLoading.showError(e.response?.data['message'],
            duration: Duration(seconds: 4));
      } 
      print(e);
      return null;
    }
  }
}
