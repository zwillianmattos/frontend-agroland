import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/acoes/models/cotacao_model.dart';

class CotacaoRepository extends Disposable {
  final Dio _http;

  CotacaoRepository(this._http);

  Future<CotacaoModel> get(String cultures) async {
    Response response = await _http.get('/finances?q=$cultures',
        options: Options(headers: {
          'Origin': 'http://localhost',
        }));
    var data = response.data;

    if (data == null) return CotacaoModel();

    CotacaoModel list = CotacaoModel.fromJson(data['finances'][0]);
    return list;
  }

  @override
  void dispose() {}
}
