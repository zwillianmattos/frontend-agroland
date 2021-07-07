import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/models/news.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/repositories/news_repository.dart';
import '../../../bottom_navigator_store.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final NewsRepository newsRepository;

  @observable
  ObservableList<NewsModel> newsList = ObservableList<NewsModel>.of([]);

  _HomeStoreBase(this.newsRepository) {
    loadNews();
  }

  @action
  loadNews() async {
    newsList = ObservableList<NewsModel>.of(await newsRepository.getAll());
  }

  @action
  ebookPage() {
    Modular.to.pushNamed('/education/ebook', forRoot: true);
  }
}
