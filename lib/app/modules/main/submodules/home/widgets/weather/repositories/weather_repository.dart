import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:location/location.dart';
import 'package:plant_care/app/core/services/location/location_service.dart';
import 'package:plant_care/app/modules/main/submodules/home/widgets/weather/models/weather.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:path_provider/path_provider.dart' as pp;

class WeatherRepository extends Disposable {
  final Dio _http;
  final LocationService _locationService;
  late CacheStore cacheStore;
  late CacheOptions cacheOptions;

  WeatherRepository(this._http, this._locationService) {
    print("Weather Repository");
    init();
  }

  init() async {
    var dir = await pp.getApplicationDocumentsDirectory();
    cacheStore = DbCacheStore(databasePath: dir.path, logStatements: true);
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
    _http.interceptors.add(DioCacheInterceptor(options: cacheOptions));
  }

  Future<Weather> get() async {
    LocationData location = await _locationService.locationData;
    print(location);

    Response response = await _http.get(
        'https://api.hgbrasil.com/weather?key=2b81ac59&lat=${location.latitude}&lon=${location.longitude}&user_ip=remote',
        options:
            cacheOptions.copyWith(policy: CachePolicy.forceCache).toOptions());

    // var response = jsonDecode(MOCK_WEATHER);

    if (response == null) {
      return Weather();
    }

    var data = response.data;
    Weather weather = Weather.fromJson(data);
    return weather;
  }

  @override
  void dispose() async {
    this.dispose();
    await cacheStore.close();
  }
}
