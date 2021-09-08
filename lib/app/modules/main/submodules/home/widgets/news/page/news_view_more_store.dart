import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/services/local_storage/local_storage.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/models/news.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/repositories/news_repository.dart';

part 'news_view_more_store.g.dart';

class NewsViewMoreStore = _NewsViewMoreStoreBase with _$NewsViewMoreStore;

abstract class _NewsViewMoreStoreBase with Store {
  final NewsRepository newsRepository;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<dynamic> listNewsSaved = [].asObservable();

  _NewsViewMoreStoreBase(this.newsRepository) {
    loadSavedNews();
  }

  @action
  loadSavedNews() async {
    isLoading = true;
    var newsSaved = await LocalStorage.getValue<String>('news_data');
    print(newsSaved);
    if (newsSaved != null  && newsSaved != '') {
      List<dynamic> list =
          jsonDecode(newsSaved).map((e) => NewsModel.fromJson(e)).toList();
      listNewsSaved = list.asObservable();
    } else {
      listNewsSaved = [].asObservable();
    }

    isLoading = false;
  }
}
