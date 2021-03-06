import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/models/models/paginate_model.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/models/ebook_model.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/repositories/ebook_repository.dart';

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
    if (ebooksController!.position.extentAfter < 500 && isLoading == false) {
      if (currentPage < paginateModel.totalPages!) {
        currentPage++;
        loadPage();
      }
    }
  }

  @action
  refresh() async {
    isLoading = true;
    currentPage = 0;
    totalPage = 0;
    ebooksController!.jumpTo(0);
    ebooksList = <Ebook>[].asObservable();
    await loadPage();
    isLoading = false;
    return true;
  }

  @action
  loadPage({
    query: "?size=10",
  }) async {
    paginateModel = await repository.load(
      query: "?size=10&page=$currentPage",
    );

    if (paginateModel.items is List<Ebook>) {
      var data = paginateModel.items;
      ebooksList.addAll(data as List<Ebook>);
    }
  }

  @action
  load({
    query: "?size=10",
  }) async {
    isLoading = true;

    PaginateModel _paginateModel = await repository.load(
      query: query,
    );

    if (_paginateModel.items is List<Ebook>) {
      var data = _paginateModel.items;
      ebooks.addAll(data as List<Ebook>);
    }
    isLoading = false;
  }
}
