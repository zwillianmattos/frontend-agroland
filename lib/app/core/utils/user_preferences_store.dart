import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/models/account.dart';
import 'package:plant_care/app/core/services/local_storage/local_storage.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:plant_care/app/modules/account/repositories/account_repository.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models/producer_user.dart';

part 'user_preferences_store.g.dart';

class UserPreferencesStore = _UserPreferencesStoreBase
    with _$UserPreferencesStore;

abstract class _UserPreferencesStoreBase with Store {
  @observable
  AccountModel? accountModel;

  final AccountRepository accountRepository;

  @observable
  bool darkTheme = false;

  _UserPreferencesStoreBase(this.accountRepository) {
    print("[UserPreferences]: Initializing");
    this.isAuth();

    // load data from local storage
    _loadFromLocalStorage();
  }

  @action
  Future<void> _loadFromLocalStorage() async {
    var data = await LocalStorage.getValue<bool>('dark_theme');
    print("buscou do banco $data");
    if (data == null) {
      darkTheme = false;
    } else {
      darkTheme = data;
    }
  }

  @action
  setUser(AccountModel user) => this.accountModel = user;

  @computed
  User? get getUser {
    if (this.accountModel == null) {
      return null;
    }

    return this.accountModel?.user;
  }

  get authHeader async {
    if (this.accountModel == null) {
      return Options(headers: {
        'Origin': 'http://localhost',
      });
    }
    return Options(headers: {
      'Origin': 'http://localhost',
      'Authorization': 'authorization ${this.accountModel!.token}'
    });
  }

  isAuth() async {
    String? account = await LocalStorage.getValue<String>("user");
    // Check token is not null
    if (account == '' || account == null) return false;
    // Convert data to json
    var data = jsonDecode(account);
    this.accountModel = AccountModel.fromJson(data);
  }

  refreshProducerUser(ProducerUser producerUser) {
    if (this.accountModel != null) {
      this.accountModel?.user?.producerUser = producerUser;
      LocalStorage.setValue<String>(
          "user", jsonEncode(this.accountModel?.toJson()));
    }
  }

  logOff() async {
    await LocalStorage.setValue("user", "");
    this.accountModel = null;
  }

  @action
  darkMode() {
    this.darkTheme = !this.darkTheme;
    // save to local storage
    LocalStorage.setValue<bool>("dark_theme", this.darkTheme);
  }
}
