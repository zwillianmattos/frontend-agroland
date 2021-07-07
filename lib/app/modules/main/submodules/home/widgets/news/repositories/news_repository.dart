import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/news/models/news.dart';

class NewsRepository extends Disposable {
  final Dio _http;

  NewsRepository(this._http);

  Future<List<NewsModel>> getAll() async {
    Response response = await _http.get('/news',
        options: Options(headers: {
          'Origin': 'http://localhost',
        }));
    var data = response.data;

    if (data == null) return <NewsModel>[];

    List<NewsModel> list = List<NewsModel>.from(
        data['articles'].map((model) => NewsModel.fromJson(model)));
    return list;
  }

  @override
  void dispose() {}
}
