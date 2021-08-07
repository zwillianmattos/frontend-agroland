import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import 'package:universal_io/io.dart' as IO;
part 'bottom_navigator_store.g.dart';

class BottomNavigatorStore = _BottomNavigatorStoreBase
    with _$BottomNavigatorStore;

abstract class _BottomNavigatorStoreBase with Store {
  @observable
  int currentIndex = 0;

  _BottomNavigatorStoreBase() {
    if (Modular.args!.params.isNotEmpty && Modular.args!.params.length > 0) {
      print("PARAMETROS ${Modular.args?.params}");
      Modular.to.navigate(Modular.to.modulePath);
      Modular.to.pushNamed(Modular.to.path,
          forRoot: Modular.to.path.contains("/view") &&
                  (IO.Platform.isAndroid || IO.Platform.isIOS)
              ? true
              : false);

      changePage(_checkModule(Modular.to.path), navigate: false);
    } else {
      changePage(0);
    }
  }

  int? _checkModule(String module) {
    if (module.contains("/home")) {
      return 0;
    } else if (module.contains("/marketplace")) {
      return 1;
    } else if (module.contains("/community")) {
      return 2;
    } else if (module.contains("/education")) {
      return 3;
    } else if (module.contains("/home")) {
      return 4;
    }
    return 0;
  }

  @computed
  get currentPage => currentIndex;
  @action
  changePage(index, {navigate = true}) async {
    // if (currentIndex == index) return;

    currentIndex = index;

    if (!navigate) return;

    if (index == 0) {
      Modular.to.navigate('/home');
    } else if (index == 1) {
      Modular.to.navigate('/marketplace');
    } else if (index == 2) {
      Modular.to.navigate('/community');
    } else if (index == 3) {
      Modular.to.navigate('/education');
    } else if (index == 4) {
      if (Modular.get<UserPreferencesStore>().getUser != null) {
        await Modular.to.pushNamed('/account/profile',
            forRoot:
                (IO.Platform.isAndroid || IO.Platform.isIOS) ? true : false);
      } else {
        await Modular.to.pushNamed('/account/auth',
            forRoot:
                (IO.Platform.isAndroid || IO.Platform.isIOS) ? true : false);
      }
      currentIndex = 0;
      Modular.to.navigate('/home');
    }
  }
}
