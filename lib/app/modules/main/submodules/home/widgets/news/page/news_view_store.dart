import 'dart:convert';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/services/local_storage/local_storage.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/models/news.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/models/source.dart';

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
      var newsSaved = await LocalStorage.getValue<String>('news_data');

      if (newsSaved != null && newsSaved.isNotEmpty && newsSaved != '') {
        List<dynamic> list =
            jsonDecode(newsSaved).map((e) => NewsModel.fromJson(e)).toList();
        var range =
            list.indexWhere((element) => element.source.id == news!.source!.id);

        if (range != -1) {
          favorite = true;
        } else {
          favorite = false;
        }
      } else {
        favorite = false;
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
      var newsSaved = await LocalStorage.getValue<String>('news_data');

      if (newsSaved != '' && newsSaved.isNotEmpty) {
        List<dynamic> list =
            jsonDecode(newsSaved).map((e) => NewsModel.fromJson(e)).toList();
        var range =
            list.indexWhere((element) => element.source.id == news!.source!.id);
        if (range != -1) {
          list.removeAt(range);
          favorite = false;
        } else {
          list.add(news!);
          favorite = true;
        }
        await LocalStorage.setValue<String>('news_data', jsonEncode(list));
      } else {
        List<dynamic> list = [news!];
        list = list.map((e) => e.toJson()).toList();
        await LocalStorage.setValue<String>('news_data', jsonEncode(list));
        favorite = true;
      }
    } catch (e) {
      print("ERROR: $e");
      favorite = false;
    }
  }
}
