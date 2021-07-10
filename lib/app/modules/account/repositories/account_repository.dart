import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/interfaces/user_interface.dart';
import 'package:plant_care/app/core/models/account.dart';

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

  @override
  void dispose() {}
}
