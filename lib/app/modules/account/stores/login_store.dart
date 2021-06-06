import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/interfaces/user_interface.dart';
import 'package:plant_care/app/core/models/account.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:plant_care/app/modules/account/repositories/account_repository.dart';

part 'login_store.g.dart';

class LoginStore = LoginStoreBase with _$LoginStore;

abstract class LoginStoreBase with Store {
  final AccountRepository _repository;

  LoginStoreBase(this._repository);

  @observable
  bool isLoading = false;

  login(User user) async {
    try {
      isLoading = true;

      AccountModel account = await _repository.login(user);

      print(account);

      isLoading = false;
      // Modular.to.pushReplacementNamed('/dashboard');

    } catch (e) {
      print(e);
    }

    return true;
  }
}
