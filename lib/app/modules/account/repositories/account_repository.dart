import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:universal_io/io.dart';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/interfaces/user_interface.dart';
import 'package:plant_care/app/core/models/account.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:http/http.dart' as http;

class AccountRepository extends Disposable {
  final Dio _http;

  AccountRepository(this._http);

  Future<AccountModel> register(IUser user) async {
    try {
      print(user.toJson());

      Response response =
          await _http.post('/user/register', data: user.toJson());

      var data = response.data;
      print(data);
      if (!data['status']) {
        throw (data['message']);
      }

      AccountModel account = AccountModel.fromJson(data);
      return account;
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
    return AccountModel();
  }

  Future<AccountModel> login(IUser user) async {
    try {
      Response response = await _http.post('/user/login', data: user.toJson());
      print(response.data);
      var data = response.data;

      if (data['status'] != null && data['status'] == false) {
        throw (data['message']);
      }
      AccountModel account = AccountModel.fromJson(data);
      return account;
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
    return AccountModel();
  }

  Future<User> refresh() async {
    try {
      Response response = await _http.get('/user/profile',
          options: await Modular.get<UserPreferencesStore>().authHeader);
      var data = response.data;
      User account = User.fromJson(data);
      return account;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions.data);
        print(e.message);
      }
    }
    return User();
  }

  Future<String> uploadProfilePicture(String filePath) async {
    try {
      var formData = FormData.fromMap(
          {'file': await MultipartFile.fromFile(new File(filePath).path)});
      print(formData);

      Response response = await _http.post('/user/profile/photo',
          data: formData,
          options: await Modular.get<UserPreferencesStore>().authHeader);

      print(response.realUri);

      var data = response.data;
      print(data);
      if (data != null) {
        return 'https://res.cloudinary.com/dxz4ivhm8/image/upload/c_thumb,g_face,h_200,w_200/${data['public_id']}.jpg';
      }
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.realUri);
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        print(e.requestOptions.data);
        print(e.message);
      }
    }
    return "";
  }

  @override
  void dispose() {}
}
