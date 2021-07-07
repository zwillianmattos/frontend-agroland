import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/repositories/news_repository.dart';
import '../models/news.dart';

part 'news_store.g.dart';

class NewsStore = _NewsStoreBase with _$NewsStore;

abstract class _NewsStoreBase with Store {
  final NewsRepository newsRepository;

  @observable
  ObservableList<NewsModel> newsList = ObservableList<NewsModel>.of([]);

  _NewsStoreBase(this.newsRepository) {
    loadNews();
  }

  @action
  loadNews() async {
    newsList = ObservableList<NewsModel>.of(await newsRepository.getAll());
  }
}
