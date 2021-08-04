import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models/product_categories.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:plant_care/app/modules/main/submodules/marketplace/repositories/marketplace_repository.dart';

part 'announce_view_store.g.dart';

class MarketplaceAnnounceViewStore = _MarketplaceAnnounceViewStoreBase
    with _$MarketplaceAnnounceViewStore;

abstract class _MarketplaceAnnounceViewStoreBase with Store {
  final MarketplaceRepository repository;

  final formKey = GlobalKey<FormState>();

  @observable
  bool isLoading = false;

  @observable
  late ProductSell productSell = new ProductSell();

  _MarketplaceAnnounceViewStoreBase(this.repository) {
    productSell = Modular.args?.data ?? new ProductSell();
  }

  @action
  add() async {
    try {
      EasyLoading.show(status: 'Carregando...');
      // check form is valid
      if (!formKey.currentState!.validate()) {
        throw ("Erro ao validar formulario");
      }
      formKey.currentState!.save();

      productSell.productCategories = <ProductCategories>[
        new ProductCategories(
          id: 14,
        )
      ];

      ProductSell? p = await repository.store(productSell);
      if (p?.id != null) {
        Modular.to.pop();
      }

      EasyLoading.dismiss();
    } catch (e) {
      print(e);
      EasyLoading.showError(e.toString(), duration: Duration(seconds: 4));
    }
  }
}
