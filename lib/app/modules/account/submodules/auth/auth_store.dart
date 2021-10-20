import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  @observable
  bool isSignUp = false;

  @observable
  bool isSignIn = false;

  AuthStoreBase() {
    if (Modular.args?.data == null || Modular.args?.data?['signin'] == true) {
      isSignIn = true;
      isSignUp = false;
    } else if (Modular.args?.data?['signup'] == true) {
      isSignIn = false;
      isSignUp = true;
    } else {
      isSignIn = true;
      isSignUp = false;
    }
  }
}
