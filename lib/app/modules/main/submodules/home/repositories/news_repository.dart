import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/home/models/mock_news.dart';
import 'package:plant_care/app/modules/main/submodules/home/models/news.dart';

class NewsRepository extends Disposable {
  final Dio _http;

  NewsRepository(this._http);

  Future<List<NewsModel>> getAll() async {
    // Response response = await _http.get('/everything', queryParameters: {
    //   'apiKey': '2eb849c122b546d3929678e27a902aa6',
    //   'q': 'agro'
    // });

    // if (response.statusCode != 200) {
    //   return <NewsModel>[];
    // }

    // var data = response.data['articles'];
    var response = jsonDecode(MOCK_NEWS);

    if (response == null) {
      return <NewsModel>[];
    }
    var data = response['articles'];

    List<NewsModel> list =
        List<NewsModel>.from(data.map((model) => NewsModel.fromJson(model)));
    return list;
  }

  @override
  void dispose() {
    this.dispose();
  }
}
