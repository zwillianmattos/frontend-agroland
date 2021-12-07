import 'package:agro_tools/app/modules/main/submodules/marketplace/models/product_sell_photos.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/product_categories.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/product_sell.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/repositories/marketplace_repository.dart';

part 'announce_view_store.g.dart';

class MarketplaceAnnounceViewStore = _MarketplaceAnnounceViewStoreBase
    with _$MarketplaceAnnounceViewStore;

abstract class _MarketplaceAnnounceViewStoreBase with Store {
  final MarketplaceRepository repository;

  final formKey = GlobalKey<FormState>();

  @observable
  ObservableList<String> images = ObservableList<String>();

  @observable
  bool isLoading = false;

  @observable
  late ProductSell productSell = new ProductSell();

  _MarketplaceAnnounceViewStoreBase(this.repository) {
    productSell = Modular.args?.data ?? new ProductSell();

    if (productSell.id != null) {
      if (productSell.productSellPhotos != null) {
        images = ObservableList<String>.of(
            productSell.productSellPhotos!.map((e) => e.imgPath!).toList());
      }
    }
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

      if (productSell.id == null) {
        productSell.productCategories = <ProductCategories>[
          new ProductCategories(
            id: 14,
          )
        ];

        ProductSell? p = await repository.store(productSell);

        if (p?.id != null) {
          productSell = p!;
          EasyLoading.show(status: 'Produto adicionado com sucesso...');
        }
      } else {
        bool? update = await repository.update(productSell);
        if (update == true) {
          Modular.to.pop();
        }
      }

      EasyLoading.dismiss();
    } catch (e) {
      print(e);
      EasyLoading.showError(e.toString(), duration: Duration(seconds: 4));
    }
  }

  @action
  addPhoto() async {
    try {
      EasyLoading.show(status: 'Carregando...');

      XFile? file =
          await new ImagePicker().pickImage(source: ImageSource.gallery);

      if (file != null) {
        if (productSell.id != null) {
          ProductSellPhotos? img =
              await repository.updateImage(productSell.id!, file.path);
          if (img != null) {
            productSell.productSellPhotos?.add(img);
            images.add(img.imgPath!);
          }
        }
      }

      EasyLoading.dismiss();
    } catch (e) {
      print(e);
      EasyLoading.showError(e.toString(), duration: Duration(seconds: 4));
    }
  }

  @action
  removePhoto(String index) {
    try {
      EasyLoading.show(status: 'Carregando...');
      images.remove(index);
      EasyLoading.dismiss();
    } catch (e) {
      print(e);
      EasyLoading.showError(e.toString(), duration: Duration(seconds: 4));
    }
  }
}
