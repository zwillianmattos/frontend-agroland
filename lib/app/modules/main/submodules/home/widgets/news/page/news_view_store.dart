import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/services/local_storage/local_storage.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/models/news.dart';

part 'news_view_store.g.dart';

class NewsViewStore = _NewsViewStoreBase with _$NewsViewStore;

abstract class _NewsViewStoreBase with Store {
  @observable
  bool favorite = false;

  @observable
  bool isLoading = false;

  @observable
  NewsModel? news;

  _NewsViewStoreBase() {
    load();
  }

  @action
  load() async {
    try {
      isLoading = true;

      news = Modular.args?.data as NewsModel?;
      var newsSaved = await LocalStorage.getValue<String>('news');
      if (newsSaved == null || newsSaved == '') {
        favorite = false;
      } else {
        newsSaved = jsonDecode(newsSaved)
          ..map((e) => NewsModel.fromJson(e)).toList();
        if (newsSaved.contains(news!)) {
          favorite = true;
        }
      }
      isLoading = false;
    } catch (e) {
      print(e);
      isLoading = false;
    }
  }

  @action
  saveNotice() async {
    try {
      favorite = !favorite;

      var newsSaved = await LocalStorage.getValue<String>('news');

      if (newsSaved == null || newsSaved == '') {
        newsSaved = <NewsModel>[];
        newsSaved.add(news!);
      } else {
        newsSaved = jsonDecode(newsSaved)
          ..map((e) => NewsModel.fromJson(e)).toList();
        if (newsSaved.contains(news!)) {
          newsSaved.remove(news!);
        } else {
          newsSaved.add(news!);
        }
      }

      if (await LocalStorage.setValue<String>('news', jsonEncode(newsSaved))) {
        print('salvo, ${newsSaved.length}');
      }
    } catch (e) {
      print(e);
    }
  }
}
