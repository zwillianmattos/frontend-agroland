import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/models/ebook_model.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/repositories/ebook_repository.dart';

part 'education_store.g.dart';

class EducationStore = _EducationStoreBase with _$EducationStore;

abstract class _EducationStoreBase with Store {
  final EbookRepository repository;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Ebook>? ebooks;

  _EducationStoreBase(this.repository) {
    load();
  }

  @action
  load() async {
    isLoading = true;
    var data = await repository.load();
    ebooks = data!.asObservable();
    isLoading = false;
  }
}
