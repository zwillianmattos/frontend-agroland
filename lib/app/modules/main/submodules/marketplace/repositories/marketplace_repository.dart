import 'dart:convert';

import 'package:agro_tools/app/modules/main/submodules/marketplace/models/product_sell_photos.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:agro_tools/app/core/models/models/paginate_model.dart';
import 'package:agro_tools/app/core/utils/user_preferences_store.dart';
import 'package:agro_tools/app/modules/main/submodules/marketplace/models/product_categories.dart';
import '../models/product_sell.dart';

part 'marketplace_repository.g.dart';

abstract class ProductSellDatasource {
  Future<List<ProductSell>?> load();
  Future<ProductSell?> store(ProductSell productSell);
  Future<bool?> update(ProductSell productSell);
  Future<bool?> delete(ProductSell productSell);
  Future<ProductSellPhotos?> updateImage(int id, String image);
}

@Injectable(singleton: false)
class MarketplaceRepository with Store implements ProductSellDatasource {
  final Dio _http;

  MarketplaceRepository(this._http);

  @override
  void dispose() {}

  @override
  Future<bool?> delete(ProductSell productSell) async {
    try {
      productSell.excluded = 1;
      Response response = await _http.put(
          '/marketplace/announce/${productSell.id}',
          options: await Modular.get<UserPreferencesStore>().authHeader,
          data: productSell.toJson());

      var jsonResponse = response.data;
      print(jsonResponse);
      if (jsonResponse["data"] != null) {
        return true;
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Future<List<ProductSell>?> load({query: ""}) async {
    List<ProductSell> items = [];
    try {
      Response response = await _http.get('/marketplace/announces$query',
          options: await Modular.get<UserPreferencesStore>().authHeader);

      if (response.statusCode != 200) throw Error();
      var jsonResponse = response.data;
      List<dynamic> list = jsonResponse['items'];
      if (list.isNotEmpty) {
        list.asMap().forEach((key, value) {
          items.add(ProductSell.fromJson(value));
        });
      }
    } catch (e) {
      print(e);
    }

    return items;
  }

  @override
  Future<bool?> update(ProductSell productSell) async {
    try {
      Response response = await _http.put(
          '/marketplace/announce/${productSell.id}',
          options: await Modular.get<UserPreferencesStore>().authHeader,
          data: productSell.toJson());

      var jsonResponse = response.data;
      print(jsonResponse);
      if (jsonResponse["data"] != null) {
        return true;
      }
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions.data);
        print(e.message);
      }
    } catch (e) {
      print(e);
    }

    return false;
  }

  @override
  Future<ProductSellPhotos?> updateImage(int id, String image) async {
    try {
      var form = FormData.fromMap({'file': MultipartFile.fromFileSync(image)});

      Response response = await _http.post('/marketplace/announce/$id/upload',
          options: await Modular.get<UserPreferencesStore>().authHeader,
          data: form);

      var jsonResponse = response.data;
      return ProductSellPhotos.fromJson(jsonResponse);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions.data);
        print(e.message);
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  @override
  Future<ProductSell?> store(ProductSell productSell) async {
    try {
      Response response = await _http.post('/marketplace/announce',
          options: await Modular.get<UserPreferencesStore>().authHeader,
          data: productSell.toJson());

      var jsonResponse = response.data;
      return ProductSell.fromJson(jsonResponse["data"]);
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      if (e.response != null) {
        print(e.response!.data);
        print(e.response!.headers);
        print(e.response!.requestOptions);
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print(e.requestOptions.data);
        print(e.message);
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  Future<List<ProductCategories>?> getCategories() async {
    try {
      List<ProductCategories> items = [];

      Response response = await _http.get('/marketplace/category',
          options: await Modular.get<UserPreferencesStore>().authHeader);
      if (response.statusCode != 200) throw Error();
      var jsonResponse = response.data;
      List<dynamic> list = jsonResponse["data"]['items'];
      if (list.isNotEmpty) {
        list.asMap().forEach((key, value) {
          items.add(ProductCategories.fromJson(value));
        });

        return items;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }

  @override
  Future<PaginateModel> paginate({query: ""}) async {
    List<ProductSell> listaEbooks = [];
    try {
      Response response = await _http.get('/marketplace/announces$query',
          options: await Modular.get<UserPreferencesStore>().authHeader);

      if (response.statusCode != 200) throw Error();

      var jsonResponse = response.data;

      List<dynamic> list = jsonResponse['items'];
      if (list != null) {
        list.asMap().forEach((key, value) {
          listaEbooks.add(ProductSell.fromJson(value));
        });
      }
      return PaginateModel(
          currentPage: jsonResponse['currentPage'],
          totalPages: jsonResponse['totalPages'],
          totalItems: jsonResponse['totalItems'],
          items: listaEbooks);
    } catch (e) {
      print("erro");
      print(e);

      return PaginateModel(
          currentPage: 0, totalPages: 0, totalItems: 0, items: []);
    }
  }
}
