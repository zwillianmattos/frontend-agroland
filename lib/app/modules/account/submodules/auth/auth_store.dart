import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  @observable
  bool isSignUp = false;

  @observable
  bool isSignIn = true;

  AuthStoreBase() {
    if (Modular.args?.data == null || Modular.args?.data?['isSignIn'] == true) {
      isSignIn = true;
      isSignUp = false;
    } else {
      isSignIn = false;
      isSignUp = true;
    }
  }
}
