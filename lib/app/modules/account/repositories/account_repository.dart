import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/core/interfaces/user_interface.dart';
import 'package:plant_care/app/core/models/account.dart';

class AccountRepository extends Disposable {
  final Dio _http;

  AccountRepository(this._http);

  Future<AccountModel> login(IUser user) async {
    Response response = await _http.post('/', data: {});

    print(response);

    return AccountModel();
  }

  @override
  void dispose() {
  }
}
