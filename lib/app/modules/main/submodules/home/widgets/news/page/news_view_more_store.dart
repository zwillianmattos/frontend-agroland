
import 'dart:convert';

import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/services/local_storage/local_storage.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/models/news.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/repositories/news_repository.dart';

part 'news_view_more_store.g.dart';

class NewsViewMoreStore = _NewsViewMoreStoreBase with _$NewsViewMoreStore;

abstract class _NewsViewMoreStoreBase with Store {
  final NewsRepository newsRepository;

  List<NewsModel> news = [];

  _NewsViewMoreStoreBase(this.newsRepository){
    loadSavedNews();
  }

  @action
  loadSavedNews() async {
    
      Map<String, dynamic>? newsSaved =
          jsonDecode(await LocalStorage.getValue<String>('news'));
      if (newsSaved == null) {
        newsSaved = Map<String, dynamic>();
      }
  }
}