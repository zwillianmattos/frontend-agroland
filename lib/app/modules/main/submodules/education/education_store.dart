import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/models/models/paginate_model.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/models/ebook_model.dart';
import 'package:plant_care/app/modules/main/submodules/education/ebook/repositories/ebook_repository.dart';

part 'education_store.g.dart';

class EducationStore = _EducationStoreBase with _$EducationStore;

abstract class _EducationStoreBase with Store {
  final EbookRepository repository;

  @observable
  ScrollController? ebooksController;

  @observable
  bool isLoading = false;

  int currentPage = 0;
  int totalPage = 0;

  late PaginateModel paginateModel;

  @observable
  ObservableList<Ebook> ebooks = <Ebook>[].asObservable();

  @observable
  ObservableList<Ebook> ebooksList = <Ebook>[].asObservable();

  @observable
  ObservableList<Ebook> ebookBanners = <Ebook>[].asObservable();


  @observable
  ObservableList<String> videosList = <String>[
    "9f7uB081yxs",
    "_ekYnxtgYCg",
    "NvId36FE1mM",
    "EiZNVylZz48"
  ].asObservable();

  _EducationStoreBase(this.repository) {
    ebooksController = new ScrollController()..addListener(_scrollListener);
    load();
    loadPage();
    loadBanners();
  }


  @action
  loadBanners() async {
    isLoading = true;

    PaginateModel _paginateModel = await repository.load(
      query: "?size=5&categoria=3",
    );

    if (_paginateModel.items is List<Ebook>) {
      var data = _paginateModel.items;
      ebookBanners.addAll(data as List<Ebook>);
    }
    isLoading = false;
  }

  @action
  void _scrollListener() {
    print(ebooksController!.position.extentAfter);
    if (ebooksController!.position.extentAfter < 500 && isLoading == false) {
      // Request next Page
      print("loading next Page $currentPage");

      if (currentPage < paginateModel.totalPages!) {
        currentPage++;
        loadPage();
      }
    }
  }

  @action
  loadPage({
    query: "?size=10",
  }) async {
    isLoading = true;
    paginateModel = await repository.load(
      query: "?size=10&page=$currentPage",
    );

    if (paginateModel.items is List<Ebook>) {
      var data = paginateModel.items;
      ebooksList.addAll(data as List<Ebook>);
    }
    isLoading = false;
  }

  @action
  load({
    query: "?size=10",
  }) async {
    isLoading = true;

    PaginateModel _paginateModel = await repository.load(
      query: "?size=5",
    );

    if (_paginateModel.items is List<Ebook>) {
      var data = _paginateModel.items;
      ebooks.addAll(data as List<Ebook>);
    }
    isLoading = false;
  }
}
