import 'package:mobx/mobx.dart';

import '../repositories/ebook_repository.dart';
import '../models/ebook_model.dart';

part 'ebook_page_store.g.dart';

class EbookPageStore = _EbookPageStoreBase with _$EbookPageStore;

abstract class _EbookPageStoreBase with Store {
  final EbookRepository repository;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<Ebook>? ebooks;

  _EbookPageStoreBase(this.repository);

  @action
  loadEbooks() async {

    return ebooks;
  }
}
