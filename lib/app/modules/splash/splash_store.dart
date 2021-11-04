import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:mobx/mobx.dart';

part 'splash_store.g.dart';

class SplashStore = _SplashStoreBase with _$SplashStore;

abstract class _SplashStoreBase with Store {
  final UserPreferencesStore userPreferencesStore;
  _SplashStoreBase(this.userPreferencesStore);
}
