import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/repositories/marketplace_repository.dart';

part 'marketplace_home_store.g.dart';

class MarketplaceHomeStore = _MarketplaceHomeStoreBase
    with _$MarketplaceHomeStore;

abstract class _MarketplaceHomeStoreBase with Store {
  final MarketplaceRepository repository;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<ProductSell>? products;


  _MarketplaceHomeStoreBase(this.repository) {
    load();
  }

  @action
  load() async {
    isLoading = true;
    var data = await repository.load();
    products = data!.asObservable();
    isLoading = false;
  }
}
