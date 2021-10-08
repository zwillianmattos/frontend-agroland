import 'package:flutter_modular/flutter_modular.dart';
import 'package:location/location.dart';
import 'package:universal_io/io.dart' as IO;

class LocationService implements Disposable {
  Location location = new Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  PermissionStatus? _requestPermission;
  LocationData? _locationData;

  LocationService();

  getLocation() async {
    _locationData = LocationData.fromMap({
      "latitude": -22.2877973,
      "longitude": -49.2306352,
    });

    try {
      if (IO.Platform.isAndroid || IO.Platform.isIOS) {
        print("[Location Service]: Init");

        _serviceEnabled = await location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
          if (!_serviceEnabled) {
            return;
          }
        }

        _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted != PermissionStatus.granted ||
              _permissionGranted != PermissionStatus.grantedLimited) {
            return;
          }
        }

        _requestPermission = await location.requestPermission();
        if (_requestPermission == PermissionStatus.denied) {
          _requestPermission = await location.requestPermission();
          if (_requestPermission != PermissionStatus.granted ||
              _requestPermission != PermissionStatus.grantedLimited) {
            return;
          }
        }

        _locationData = await location.getLocation();
        print("$_locationData, ${await location.getLocation()}");
        print("$_serviceEnabled, $_permissionGranted");
        return _locationData;
      }
      return _locationData;
    } catch (e) {
      print("[Location Service]: $e");

      return false;
    }
  }

  get locationData async => await getLocation();

  @override
  void dispose() {}
}
