import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/product_categories.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/repositories/marketplace_repository.dart';

part 'marketplace_home_store.g.dart';

class MarketplaceHomeStore = _MarketplaceHomeStoreBase
    with _$MarketplaceHomeStore;

abstract class _MarketplaceHomeStoreBase with Store {
  final MarketplaceRepository repository;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<ProductSell>? products;

  @observable
  ObservableList<ProductCategories>? categories;

  @observable
  int indexCategory = 0;

  _MarketplaceHomeStoreBase(this.repository) {
    load();
    getCategories();
  }

  @action
  load({query: "?size=20"}) async {
    isLoading = true;
    var data = await repository.load(query: query);
    products = data!.asObservable();
    products!.shuffle();
    isLoading = false;
  }

  @action
  getCategories() async {
    var data = await repository.getCategories();
    categories = data!.asObservable();
  }

  @action
  selectCategory(element) async {
    indexCategory = categories!.indexOf(element);
    await load(query: "?category=${element.id}&size=20");
  }
}
