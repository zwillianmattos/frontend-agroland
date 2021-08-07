import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/models/models/paginate_model.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/models/ebook_model.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/repositories/ebook_repository.dart';

part 'ebook_view_store.g.dart';

class EbookViewStore = _EbookViewStoreBase with _$EbookViewStore;

abstract class _EbookViewStoreBase with Store {
  final EbookRepository repository;

  @observable
  bool isLoading = false;

  @observable
  Ebook? ebook;

  _EbookViewStoreBase(this.repository) {
    if (Modular.args?.params['id'] != null) {
      loadEbook();
    }
  }

  loadEbook() async {
    isLoading = true;
    PaginateModel paginateModel =
        await this.repository.load(query: "?id=${Modular.args?.params['id']}");
    print(paginateModel);
    ebook = paginateModel.items?.first;
    isLoading = false;
  }
}
