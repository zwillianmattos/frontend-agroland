import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/models/account.dart';
import 'package:agro_tools/app/core/services/local_storage/local_storage.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/modules/account/models/user.dart';
import 'package:agro_tools/app/modules/account/repositories/account_repository.dart';

part 'signin_store.g.dart';

class SignInStore = SignInStoreBase with _$SignInStore;

abstract class SignInStoreBase with Store {
  final AccountRepository _repository;

  final formKey = GlobalKey<FormState>();

  @observable
  User user = new User();

  SignInStoreBase(this._repository) {}

  @observable
  bool isLoading = false;

  signIn() async {
    try {
      EasyLoading.show(status: 'Carregando...');

      // check form is valid
      if (!formKey.currentState!.validate()) {
        throw ("Erro ao validar formulario");
      }

      formKey.currentState!.save();
      AccountModel account = await _repository.login(user);

      if (account.token == null) {
        throw ("Erro ao logar");
      }
      // save account in local storage
      String data = jsonEncode(account.toJson());
      if (await LocalStorage.setValue("user", data) && data != null) {
        Modular.get<UserPreferencesStore>().setUser(account);
        if( Modular.to.canPop() ) {
          Modular.to.pop();
        }
        Modular.to.navigate('/');
      }
      // redirect to home

      EasyLoading.dismiss();
    } catch (e) {
      print(e);
      EasyLoading.showError(e.toString(), duration: Duration(seconds: 4));
    }

    return true;
  }
}
