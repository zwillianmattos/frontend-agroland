import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/culture.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/repositories/cultures_repository.dart';

part 'cultures_list_store.g.dart';

class CulturesListStore = _CulturesListStoreBase with _$CulturesListStore;

abstract class _CulturesListStoreBase with Store {
  @observable
  ObservableList<Culture>? cultures;

  @observable
  bool isLoading = false;

  final CulturesRepository repository;

  _CulturesListStoreBase(this.repository) {
    loadCultures();
  }

  @action
  loadCultures() async {
    try {
      isLoading = true;
      this.cultures =
          (await this.repository.getCultures() as List<Culture>).asObservable();
      isLoading = false;
    } catch (e) {
      this.cultures = null;
      isLoading = false;
    }
  }
}
