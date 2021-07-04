import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  @observable
  bool isSignUp = false;

  @observable
  bool isSignIn = true;

  AuthStoreBase() {}
}
