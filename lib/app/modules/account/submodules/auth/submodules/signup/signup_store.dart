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

part 'signup_store.g.dart';

class SignUpStore = SignUpStoreBase with _$SignUpStore;

abstract class SignUpStoreBase with Store {
  final AccountRepository _repository;

  final formKey = GlobalKey<FormState>();

  @observable
  bool isLoading = false;

  @observable
  User user = new User();

  SignUpStoreBase(this._repository);

  signUp() async {
    try {
      EasyLoading.show(status: 'Carregando...');

      // check form is valid
      if (!formKey.currentState!.validate()) {
        throw ("Preencha todos os campos antes de continuar");
      }

      formKey.currentState!.save();
      AccountModel account = await _repository.register(user);

      if (account.token == null) {
        throw ("Erro ao se cadastrar");
      }
      // save account in local storage
      String data = jsonEncode(account.toJson());
      if (await LocalStorage.setValue("user", data) && data != null) {
        EasyLoading.showSuccess('Conta criada com sucesso!',
            duration: Duration(seconds: 2));
        Modular.get<UserPreferencesStore>().setUser(account);
        Modular.to.pushReplacementNamed('/');
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
