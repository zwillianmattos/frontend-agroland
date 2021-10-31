import 'package:agro_tools/app/core/services/cidade_estado/cidade_model.dart';
import 'package:agro_tools/app/core/services/cidade_estado/estado_model.dart';
import 'package:dio/dio.dart';

class CidadeEstadoService {
  final Dio _http;

  CidadeEstadoService(this._http);

  Future<List<EstadoModel>?> retornaEstados() async {
    Response response = await _http.get("/localidades/estados");
    List<dynamic> list = response.data;
    List<EstadoModel> listaEstados = [];
    if (list != null) {
      list.asMap().forEach((key, value) {
        listaEstados.add(EstadoModel.fromJson(value));
      });
    }

    return listaEstados;
  }

  Future<List<CidadeModel>?> retornaCidadePorUf(String uf) async {
    Response response = await _http.get("/localidades/estados/$uf/municipios");
    List<dynamic> list = response.data;
    List<CidadeModel> listaCidades = [];
    if (list != null) {
      list.asMap().forEach((key, value) {
        listaCidades.add(CidadeModel.fromJson(value));
      });
    }

    return listaCidades;
  }
}
