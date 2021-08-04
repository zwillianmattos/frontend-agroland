import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  _HomeStoreBase() {}

  @action
  ebookPage() {
    Modular.to.pushNamed('/education/ebook', forRoot: true);
  }
}
