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

part 'profile_store.g.dart';

class ProfileStore = _ProfileStoreBase with _$ProfileStore;

abstract class _ProfileStoreBase with Store {
  final AccountRepository repository;

  @observable
  bool isLoading = false;

  @observable
  User? account;

  @observable
  String userPhotoUrl =
      "https://freepikpsd.com/media/2019/10/default-profile-image-png-1-Transparent-Images.png";

  _ProfileStoreBase(this.repository) {
    refresh();
  }

  @action
  refresh() {
    try {
      account = Modular.get<UserPreferencesStore>().getUser!;
      if (account != null) {
        userPhotoUrl = account!.imgLogo!;
      }
    } catch (e) {
      print("ERROR: $e");
    }
  }
}
