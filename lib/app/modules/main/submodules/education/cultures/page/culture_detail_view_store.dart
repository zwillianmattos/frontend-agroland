import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/culture.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/culture_content.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/models/cultures_categories_rels.dart';
import 'package:plant_care/app/modules/main/submodules/education/cultures/repositories/cultures_repository.dart';
import 'dart:convert';

part 'culture_detail_view_store.g.dart';

class CultureDetailViewStore = _CultureDetailViewStoreBase
    with _$CultureDetailViewStore;

abstract class _CultureDetailViewStoreBase with Store {
  @observable
  CulturesCategoriesRels? culturesCategoriesRels;

  @observable
  bool isLoading = false;

  @observable
  CultureContent? content;

  final CulturesRepository repository;

  _CultureDetailViewStoreBase(this.repository) {
    loadCultureDetail();
  }

  @action
  loadCultureDetail() async {
    try {
      isLoading = true;
      print(Modular.args?.params);
      this.culturesCategoriesRels = (await this
              .repository
              .getCultureCategorieDetail(
                  cultureId: Modular.args?.params['culture'],
                  categorieId: Modular.args?.params['category'])
          as CulturesCategoriesRels);

      if (culturesCategoriesRels != null) {
        this.content = culturesCategoriesRels!.culturesContents?.where(
            (element) => element.id == int.parse(Modular.args?.params["item"])).first;
      }

      isLoading = false;
    } catch (e) {
      content = null;
      isLoading = false;
    }
  }
}
