import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/culture.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/cultures_categories_rels.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/cultures_category.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/repositories/cultures_repository.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/acoes/models/cultures.dart';

part 'cultures_category_store.g.dart';

class CulturesCategoryStore = _CulturesCategoryStoreBase
    with _$CulturesCategoryStore;

abstract class _CulturesCategoryStoreBase with Store {
  @observable
  Culture? culture;

  final CulturesRepository repository;

  _CulturesCategoryStoreBase(this.repository) {
    loadCultureCategories();
  }

  @action
  loadCultureCategories() async {
    var cultureId = Modular.args?.params['culture'];
    this.culture =
        await this.repository.getCultureCategories(cultureId: cultureId);
  }
}
