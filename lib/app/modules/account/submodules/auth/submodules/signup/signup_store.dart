import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/models/account.dart';
import 'package:plant_care/app/modules/account/models/user.dart';
import 'package:plant_care/app/modules/account/repositories/account_repository.dart';

part 'signup_store.g.dart';

class SignUpStore = SignUpStoreBase with _$SignUpStore;

abstract class SignUpStoreBase with Store {
  final AccountRepository _repository;

  SignUpStoreBase(this._repository);

  @observable
  bool isLoading = false;

  signUp(User user) async {
    try {
      isLoading = true;
      await Future.delayed(Duration(seconds: 30));
      isLoading = false;
    } catch (e) {
      print(e);
    }

    return true;
  }
}
