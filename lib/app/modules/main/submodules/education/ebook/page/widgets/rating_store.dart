import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/models/ebook_model.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/models/rating_model.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/repositories/rating_repository.dart';

import '../ebook_view_store.dart';

part 'rating_store.g.dart';

class RatingStore = _RatingStoreBase with _$RatingStore;

abstract class _RatingStoreBase with Store {
  final formKey = GlobalKey<FormState>();
  final RatingRepository ratingRepository;

  @observable
  bool isLoading = false;

  @observable
  Ebook? ebook;

  _RatingStoreBase(this.ratingRepository) {
    ebook = Modular.get<EbookViewStore>().ebook;
  }

  @observable
  RatingModel? rating = RatingModel(
    rating: 0.0,
  );

  @action
  sendRate() async {
    try {
      isLoading = true;
      // check form is valid
      if (!formKey.currentState!.validate()) {
        throw ("Erro ao validar formulario");
      }

      formKey.currentState?.save();

      // send rate
      var response = await this.ratingRepository.rate(
            this.rating!,
            Modular.args?.params['id'],
          );
    } catch (e) {
      print(e);
      EasyLoading.showError(e.toString(), duration: Duration(seconds: 4));
    } finally {
      await Modular.get<EbookViewStore>().loadEbook(showLoad: false);
      ebook = Modular.get<EbookViewStore>().ebook;
      formKey.currentState?.reset();
      isLoading = false;
      rating = RatingModel(
        rating: 0.0,
      );
      EasyLoading.showSuccess("Comentário adicionado com sucesso!",
          duration: Duration(seconds: 4));
    }
  }
}
