import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:plant_care/app/core/utils/user_preferences_store.dart';
import '../models/product_sell.dart';

part 'marketplace_repository.g.dart';

abstract class ProductSellDatasource {
  Future<List<ProductSell>?> load();
  Future<List<ProductSell>?> store();
  Future<List<ProductSell>?> delete();
}

@Injectable(singleton: false)
class MarketplaceRepository with Store implements ProductSellDatasource {
  final Dio _http;

  MarketplaceRepository(this._http);

  @override
  void dispose() {}

  @override
  Future<List<ProductSell>?> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<ProductSell>?> load({query: ""}) async {
    List<ProductSell> items = [];
    try {

      print(await Modular.get<UserPreferencesStore>().authHeader);
      
      Response response = await _http.get('/marketplace/announces$query',
          options: await Modular.get<UserPreferencesStore>().authHeader);

      if (response.statusCode != 200) throw Error();

      print(response.realUri);
      var jsonResponse = response.data;
      print(jsonResponse);
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
  Future<List<ProductSell>?> store() {
    // TODO: implement store
    throw UnimplementedError();
  }
}
