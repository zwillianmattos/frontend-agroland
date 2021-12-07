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
import 'package:image_picker/image_picker.dart';

part 'profile_edit_store.g.dart';

class ProfileEditStore = _ProfileEditStoreBase with _$ProfileEditStore;

abstract class _ProfileEditStoreBase with Store {
  final AccountRepository repository;

  @observable
  bool isLoading = false;

  @observable
  User? account;

  @observable
  String? userPhotoUrl;

  @observable
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  _ProfileEditStoreBase(this.repository) {
    account = Modular.get<UserPreferencesStore>().getUser!;
    userPhotoUrl = account?.imgLogo ??
        "https://freepikpsd.com/media/2019/10/default-profile-image-png-1-Transparent-Images.png";
  }

  @action
  uploadPhoto() async {
    try {
      isLoading = true;

      final ImagePicker _picker = ImagePicker();

      final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);

      if (photo != null) {
        print(photo.path);

        userPhotoUrl = await this.repository.uploadProfilePicture(photo.path);

        final User userData = await this.repository.refresh();

        AccountModel refresh = AccountModel(
            token: Modular.get<UserPreferencesStore>().accountModel!.token,
            user: userData);
        String data = jsonEncode(refresh.toJson());

        if (await LocalStorage.setValue("user", data) && data != null) {
          EasyLoading.showSuccess('Foto de perfil atualizada com sucesso!',
              duration: Duration(seconds: 2));

          Modular.get<UserPreferencesStore>().setUser(refresh);
          if (await Modular.get<UserPreferencesStore>().isAuth()) {
            print("autenticado");
          }
        }
      }

      isLoading = false;
    } catch (e) {
      print(e);
      isLoading = false;
    }
  }

  // @action
  // updateAccount() async {
  //   try {
  //     EasyLoading.show(status: 'Carregando...');

  //     // check form is valid
  //     if (!formKey.currentState!.validate()) {
  //       throw ("Erro ao validar formulario");
  //     }

  //     formKey.currentState!.save();
  //     AccountModel account = await repository.update(account!);

  //     if (account.token == null) {
  //       throw ("Erro ao logar");
  //     }
  //     // save account in local storage
  //     String data = jsonEncode(account.toJson());
  //     if (await LocalStorage.setValue("user", data) && data != null) {
  //       Modular.get<UserPreferencesStore>().setUser(account);
  //       if( Modular.to.canPop() ) {
  //         Modular.to.pop();
  //       }
  //       Modular.to.navigate('/');
  //     }
  //     // redirect to home

  //     EasyLoading.dismiss();
  //   } catch (e) {
  //     print(e);
  //     EasyLoading.showError(e.toString(), duration: Duration(seconds: 4));
  //   }
  // }

}
