import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/models/account.dart';
import 'package:plant_care/app/core/services/local_storage/local_storage.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:plant_care/app/modules/account/repositories/account_repository.dart';
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
}
