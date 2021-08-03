import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/repositories/news_repository.dart';
import '../models/news.dart';

part 'news_store.g.dart';

class NewsStore = _NewsStoreBase with _$NewsStore;

abstract class _NewsStoreBase with Store {
  final NewsRepository newsRepository;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<NewsModel>? newsList;

  _NewsStoreBase(this.newsRepository) {
    loadNews();
  }

  @action
  loadNews() async {
    isLoading = true;
    List<NewsModel>? list = await newsRepository.getAll();
    if (list != null) newsList = ObservableList<NewsModel>.of(list);
    isLoading = false;
  }
}
