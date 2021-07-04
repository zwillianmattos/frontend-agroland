import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/models/account.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:plant_care/app/modules/account/repositories/account_repository.dart';

part 'signin_store.g.dart';

class SignInStore = SignInStoreBase with _$SignInStore;

abstract class SignInStoreBase with Store {
  final AccountRepository _repository;

  SignInStoreBase(this._repository);

  @observable
  bool isLoading = false;

  signIn(User user) async {
    try {
      isLoading = true;

      AccountModel account = await _repository.login(user);

      print(account);

      isLoading = false;
    } catch (e) {
      print(e);
    }

    return true;
  }
}
