import 'dart:convert';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/models/account.dart';
import 'package:agro_tools/app/core/services/local_storage/local_storage.dart';
import 'package:agro_tools/app/modules/account/models/user.dart';
import 'package:agro_tools/app/modules/account/repositories/account_repository.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/producer_user.dart';

part 'user_preferences_store.g.dart';

class UserPreferencesStore = _UserPreferencesStoreBase
    with _$UserPreferencesStore;

abstract class _UserPreferencesStoreBase with Store {
  @observable
  AccountModel? accountModel;

  final AccountRepository accountRepository;

  // Global Camera object
  List<CameraDescription>? cameras;

  @observable
  bool darkTheme = false;

  _UserPreferencesStoreBase(this.accountRepository) {
    print("[UserPreferences]: Initializing");
    this.isAuth();

    // load data from local storage
    _loadFromLocalStorage();
    loadCameras();
  }

  Future<List<CameraDescription>?> loadCameras() async {
    cameras = await availableCameras();
    return cameras;
  }

  get retornaCameras async => await loadCameras();

  @action
  Future<void> _loadFromLocalStorage() async {
    var data = await LocalStorage.getValue<bool>('dark_theme');
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

  Future<bool> isAuth({bool redirect = false}) async {
    String? account = await LocalStorage.getValue<String>("user");
    // Check token is not null
    if (account == '' || account == null) return false;
    // Convert data to json
    var data = jsonDecode(account);
    this.accountModel = AccountModel.fromJson(data);

    if (redirect) {
      Modular.to.pushNamed('/account');
    }

    return true;
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
    Modular.to.pushReplacementNamed('/account/auth');
    this.accountModel = null;
  }

  @action
  darkMode() {
    this.darkTheme = !this.darkTheme;
    // save to local storage
    LocalStorage.setValue<bool>("dark_theme", this.darkTheme);
  }
}
