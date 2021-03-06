import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/producer_user.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/repositories/marketplace_repository.dart';

part 'marketplace_view_account_store.g.dart';

class MarketplaceViewAccoutStore = _MarketplaceViewAccoutStoreBase
    with _$MarketplaceViewAccoutStore;

abstract class _MarketplaceViewAccoutStoreBase with Store {
  final MarketplaceRepository repository;

  late ProducerUser logista;

  @observable
  bool isLoading = false;

  @observable
  ObservableList<ProductSell>? products;

  _MarketplaceViewAccoutStoreBase(this.repository) {
    this.logista = Modular.args!.data as ProducerUser;
    load();
  }

  @action
  load() async {
    isLoading = true;
    var data = await repository.load(query: "?producerUser=${logista.id}");
    products = data!.asObservable();
    isLoading = false;
  }
}
