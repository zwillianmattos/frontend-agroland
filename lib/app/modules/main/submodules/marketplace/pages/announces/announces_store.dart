import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/models/account.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/repositories/marketplace_repository.dart';

part 'announces_store.g.dart';

class MarketplaceAnnouncesStore = _MarketplaceAnnouncesStoreBase
    with _$MarketplaceAnnouncesStore;

abstract class _MarketplaceAnnouncesStoreBase with Store {
  final MarketplaceRepository repository;

  @observable
  ObservableList<ProductSell>? announces;

  late AccountModel? accountModel;

  @observable
  bool isLoading = false;

  _MarketplaceAnnouncesStoreBase(this.repository) {
    accountModel = Modular.get<UserPreferencesStore>().accountModel;
    loadAnnounces();
  }

  @action
  loadAnnounces() async {
    isLoading = true;
    var data = await this.repository.load(
        query:
            "?producerUser=${accountModel?.user?.producerUser?.id}&size=100");
    announces = data!.asObservable();
    isLoading = false;
  }

  @action
  removeAnnounce(int id) async {
    isLoading = true;
    await this.repository.delete(announces![id]);
    await loadAnnounces();
    isLoading = false;
  }
}
