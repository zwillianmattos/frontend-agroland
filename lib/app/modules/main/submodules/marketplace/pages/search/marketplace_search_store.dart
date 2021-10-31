import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/models/models/paginate_model.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/models/debouncer.dart';
import 'package:agro_tools/app/modules/main/submodules/education/ebook/models/ebook_model.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/repositories/marketplace_repository.dart';

part 'marketplace_search_store.g.dart';

class MarketplaceSearchStore = _MarketplaceSearchStoreBase
    with _$MarketplaceSearchStore;

abstract class _MarketplaceSearchStoreBase with Store {
  final MarketplaceRepository repository;

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
  ObservableList<ProductSell> searchResults = <ProductSell>[].asObservable();

  _MarketplaceSearchStoreBase(this.repository) {
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
      paginateModel = await repository.paginate(
        query: "?q=$searchText&?size=100",
      );

      if (paginateModel.items is List<ProductSell>) {
        var data = paginateModel.items;
        searchResults = (data as List<ProductSell>).asObservable();
      }
    }
    isLoading = false;
  }
}
