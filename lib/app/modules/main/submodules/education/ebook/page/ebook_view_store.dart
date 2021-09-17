import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/models/models/paginate_model.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/models/ebook_model.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/models/rating.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/models/rating_model.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/repositories/ebook_repository.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/repositories/rating_repository.dart';

import 'package:flutter_easyloading/flutter_easyloading.dart';
part 'ebook_view_store.g.dart';

class EbookViewStore = _EbookViewStoreBase with _$EbookViewStore;

abstract class _EbookViewStoreBase with Store {
  final EbookRepository repository;

  @observable
  bool isLoading = false;

  @observable
  Ebook? ebook;

  @observable 
  double ratingTotal = 0.0;

  _EbookViewStoreBase(this.repository) {
    if (Modular.args?.params['id'] != null) {
      loadEbook();
    }
  }

  @action
  loadEbook() async {
    isLoading = true;
    PaginateModel paginateModel =
        await this.repository.load(query: "?id=${Modular.args?.params['id']}");

    ebook = paginateModel.items?.first;
    
    ratingTotal = 0.0;
    
    ebook!.rating!.forEach((Rating e) {
      ratingTotal += e.rating!;
    });

    ratingTotal = ratingTotal / ebook!.rating!.length;
    isLoading = false;
  }


  @computed
  get getTotalRating => ratingTotal;

}
