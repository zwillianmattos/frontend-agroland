import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/models/models/paginate_model.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/models/ebook_model.dart';

import 'ebook/models/debouncer.dart';
import 'ebook/repositories/ebook_repository.dart';

part 'education_search_store.g.dart';

class EducationSearchStore = _EducationSearchStoreBase
    with _$EducationSearchStore;

abstract class _EducationSearchStoreBase with Store {
  final EbookRepository repository;

  @observable
  bool isLoading = false;

  @observable
  TextEditingController searchController = TextEditingController();

  late PaginateModel paginateModel;

  @observable
  var searchText = "";

  final Debouncer onSearchDebouncer =
      new Debouncer(delay: new Duration(milliseconds: 1000));

  @observable
  ObservableList<Ebook> searchResults = <Ebook>[].asObservable();

  _EducationSearchStoreBase(this.repository) {
    searchController.addListener(() {
      if (searchController.text != searchText) {
        searchText = searchController.text;
        onSearchDebouncer.debounce(
          () => search(),
        );
      }
    });
  }

  @action
  clearSearch() {
    searchText = "";
    searchController.text = "";
  }

  @action
  search() async {
    isLoading = true;
    searchResults.clear();
    if (searchText.isNotEmpty || searchText != "") {
      paginateModel = await repository.load(
        query: "?q=$searchText&?size=100",
      );

      if (paginateModel.items is List<Ebook>) {
        var data = paginateModel.items;
        searchResults = (data as List<Ebook>).asObservable();
      }
    }
    isLoading = false;
  }
}
