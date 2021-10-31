import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:location/location.dart';
import 'package:agro_tools/app/core/env/variables.dart';
import 'package:agro_tools/app/core/services/location/location_service.dart';
import 'package:agro_tools/app/modules/main/submodules/home/widgets/weather/models/weather.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:path_provider/path_provider.dart' as pp;

class WeatherRepository extends Disposable {
  final Dio _http;
  final LocationService _locationService;
  CacheStore? cacheStore;
  CacheOptions? cacheOptions;

  WeatherRepository(this._http, this._locationService) {
    print("Weather Repository");
    init();
  }

  init() async {
    try {
      var dir = await pp.getApplicationDocumentsDirectory();
      cacheStore = DbCacheStore(databasePath: dir.path, logStatements: false);
      cacheOptions = CacheOptions(
        store: cacheStore,
        policy: CachePolicy.request,
        hitCacheOnErrorExcept: [401, 403],
        maxStale: const Duration(minutes: 30),
        priority: CachePriority.normal,
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

  Future<Weather?> get() async {
    LocationData location = await _locationService.locationData;

    Options? options;

    if (cacheOptions != null) {
      options =
          cacheOptions!.copyWith(policy: CachePolicy.forceCache).toOptions();
    }

    Response response = await _http.get(
        'https://api.hgbrasil.com/weather?format=json-cors&key=${API_WEATHER_KEY}&lat=${location.latitude}&lon=${location.longitude}',
        options: options);
    if (response == null) {
      return null;
    }

    var data = response.data;
    Weather weather = Weather.fromJson(data);
    return weather;
  }

  Future<Weather?> getByCity(String city) async {
    Options? options;
    if (cacheOptions != null) {
      options =
          cacheOptions!.copyWith(policy: CachePolicy.forceCache).toOptions();
    }

    Response response = await _http.get(
        'https://api.hgbrasil.com/weather?format=json-cors&key=${API_WEATHER_KEY}&city_name=${city}',
        options: options);
    if (response == null) {
      return null;
    }

    var data = response.data;
    Weather weather = Weather.fromJson(data);
    return weather;
  }

  @override
  void dispose() async {}
}
