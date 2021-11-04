import 'package:agro_tools/app/core/services/cidade_estado/cidade_model.dart';
import 'package:agro_tools/app/core/services/cidade_estado/estado_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:path_provider/path_provider.dart' as pp;

class CidadeEstadoService {
  final Dio _http;
  CacheStore? cacheStore;
  CacheOptions? cacheOptions;
  CidadeEstadoService(this._http) {
    print("CidadeEstado Service");
    init();
  }

  init() async {
    try {
      var dir = await pp.getApplicationDocumentsDirectory();
      cacheStore = DbCacheStore(databasePath: dir.path, logStatements: false);
      cacheOptions = CacheOptions(
        store: cacheStore,
        policy: CachePolicy.forceCache,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(days: 30),
        priority: CachePriority.high,
        cipher: null,
        keyBuilder: CacheOptions.defaultCacheKeyBuilder,
        allowPostMethod: false,
      );
      if (cacheOptions != null) {
        _http.interceptors.add(DioCacheInterceptor(options: cacheOptions!));
      }
    } catch (e) {
      print("Sem suporte ao cache");
    }
  }

  Future<List<EstadoModel>?> retornaEstados() async {
    Options? options;
    if (cacheOptions != null) {
      options =
          cacheOptions!.copyWith(policy: CachePolicy.forceCache).toOptions();
    }

    Response response =
        await _http.get("/localidades/estados", options: options);

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
    Options? options;
    if (cacheOptions != null) {
      options =
          cacheOptions!.copyWith(policy: CachePolicy.forceCache).toOptions();
    }

    Response response = await _http.get("/localidades/estados/$uf/municipios",
        options: options);
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
