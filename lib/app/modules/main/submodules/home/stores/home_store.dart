import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/news/models/news.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/news/repositories/news_repository.dart';
import 'package:universal_io/io.dart' as IO;
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final NewsRepository newsRepository;

  @observable
  ObservableList<NewsModel> newsList = ObservableList<NewsModel>.of([]);

  _HomeStoreBase(this.newsRepository) {}

  @action
  ebookPage() {
    Modular.to.pushNamed('/education/ebook',
        forRoot: (IO.Platform.isAndroid || IO.Platform.isIOS) ? true : false);
  }
}
