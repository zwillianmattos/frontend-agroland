import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models/producer_user.dart';

class ProducerUserRepository extends Disposable {
  final Dio _http;

  ProducerUserRepository(this._http);

  Future<ProducerUser?> register(ProducerUser producerUser) async {
    try {
      Response response = await _http.post('/producer_user/register',
          data: producerUser.toJson(),
          options: await Modular.get<UserPreferencesStore>().authHeader);

      var data = response.data;
      print(response.data);

      if (!data['status']) {
        throw (data['message']);
      }
      return ProducerUser.fromJson(data['data']);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions.data);
        print(e.message);
      }
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }
}
