import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/models/account.dart';
import 'package:plant_care/app/core/services/local_storage/local_storage.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
part 'user_preferences_store.g.dart';

class UserPreferencesStore = _UserPreferencesStoreBase
    with _$UserPreferencesStore;

abstract class _UserPreferencesStoreBase with Store {
  AccountModel? accountModel;

  _UserPreferencesStoreBase() {
    print("[UserPreferences]: Initializing");
    this.isAuth();
  }

  set setUser(AccountModel user) => this.accountModel = user;

  User? get getUser => this.accountModel?.user;

  get authHeader async {
    if( this.accountModel == null ) {
      return Options(headers: {
        'Origin': 'http://localhost',
      });
    }
    return Options(headers: {
        'Origin': 'http://localhost',
        'Authorization':
            'authorization ${this.accountModel!.token}'
      });
  }

  isAuth() async {
    String account = await LocalStorage.getValue<String>("user");
    // Check token is not null
    if (account == '' || account == null) return false;
    // Convert data to json
    var data = jsonDecode(account);
    this.accountModel = AccountModel.fromJson(data);
  }

  logOff() async {
    await LocalStorage.setValue("user", "");
    this.accountModel = null;
  }
}
