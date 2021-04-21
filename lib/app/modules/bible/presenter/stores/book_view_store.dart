import 'package:app_inside/app/modules/bible/domain/entities/book.dart';
import 'package:app_inside/app/modules/bible/domain/errors/erros.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:mobx_triple/mobx_triple.dart';

part 'book_view_store.g.dart';

@Injectable()
class BookViewStore extends MobXStore<Failure, List<Book>> {
  BookViewStore() : super([]);

  @observable
  ObservableList<int> selectedVersicles = <int>[].asObservable();

  @action
  selectVersicle(index) {
    if (selectedVersicles.asMap().containsValue(index)) {
      selectedVersicles.remove(index);
    } else {
      selectedVersicles.add(index);
    }
  }

  @computed
  bool getSelectedVersicles(index) => selectedVersicles.asMap().containsValue(index)
                  ? true
                  : false;
}
