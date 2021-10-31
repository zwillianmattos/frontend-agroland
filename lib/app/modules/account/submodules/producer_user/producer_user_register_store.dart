import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/services/local_storage/local_storage.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/modules/account/submodules/producer_user/repositories/producer_user_repository.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/producer_user.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/producer_user_adress.dart';

part 'producer_user_register_store.g.dart';

class ProducerUserRegisterStore = _ProducerUserRegisterStoreBase
    with _$ProducerUserRegisterStore;

abstract class _ProducerUserRegisterStoreBase with Store {
  final formKey = GlobalKey<FormState>();

  @observable
  bool isLoading = false;

  @observable
  ProducerUser producerUser = new ProducerUser();

  @observable
  ProducerUserAddress producerUserAddress = new ProducerUserAddress();

  ProducerUserRepository _repository;

  _ProducerUserRegisterStoreBase(this._repository) {}

  @action
  register() async {
    try {
      EasyLoading.show(status: 'Carregando...');

      // check form is valid
      if (!formKey.currentState!.validate()) {
        throw ("Erro ao validar formulario");
      }

      formKey.currentState!.save();

      producerUser.address = producerUserAddress;

      ProducerUser? producer = await _repository.register(producerUser);

      if (producer != null) {
        Modular.get<UserPreferencesStore>().refreshProducerUser(producer);
        Modular.to.pushReplacementNamed('/');
        Modular.to.pop();
      }

      EasyLoading.dismiss();
    } catch (e) {
      print(e);
      EasyLoading.showError(e.toString(), duration: Duration(seconds: 4));
    }
  }
}
