import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/modules/main/submodules/education/cultures/models/culture.dart';
import 'package:agro_tools/app/modules/main/submodules/education/cultures/models/cultures_categories_rels.dart';
import 'package:agro_tools/app/modules/main/submodules/education/cultures/repositories/cultures_repository.dart';

part 'culture_detail_store.g.dart';

class CulturesDetailStore = _CulturesDetailStoreBase with _$CulturesDetailStore;

abstract class _CulturesDetailStoreBase with Store {
  @observable
  CulturesCategoriesRels? culturesCategoriesRels;

  @observable
  bool isLoading = false;

  final CulturesRepository repository;

  _CulturesDetailStoreBase(this.repository) {
    loadCultureDetail();
  }

  @action
  loadCultureDetail() async {
    isLoading = true;
    this.culturesCategoriesRels = (await this
            .repository
            .getCultureCategorieDetail(
                cultureId: Modular.args?.params['culture'],
                categorieId: Modular.args?.params['category'])
        as CulturesCategoriesRels);
    isLoading = false;
  }
}
