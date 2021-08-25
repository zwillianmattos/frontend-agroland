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
    news = Modular.args?.data as NewsModel?;
    load();
  }

  @action
  load() async {
    try {
      isLoading = true;
      favorite = await LocalStorage.getValue<bool>('news_${news?.url}');
      isLoading = false;
    } catch (e) {
      print(e);
    }
  }

  @action
  saveNotice() async {
    try {
      favorite = !favorite;
      await LocalStorage.setValue<bool>('news_${news?.url}', favorite);
    } catch (e) {
      print(e);
    }
  }
}
