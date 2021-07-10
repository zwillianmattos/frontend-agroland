import 'package:flutter_modular/flutter_modular.dart';
import 'package:location/location.dart';
import 'dart:io' show Platform;

class LocationService implements Disposable {
  Location location = new Location();
  bool _serviceEnabled = false;
  PermissionStatus? _permissionGranted;
  LocationData? _locationData;

  LocationService();

  getLocation() async {
    try {
      if (Platform.isWindows || (!Platform.isAndroid || Platform.isIOS)) {
        return _locationData = LocationData.fromMap({
          "latitude": -22.2877973,
          "longitude": -49.2306352,
        });
      }
      print("Location Service");

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
        if (_permissionGranted != PermissionStatus.granted) {
          return;
        }
      }

      return _locationData = await location.getLocation();
    } catch (e) {
      print(e);

      return false;
    }
  }

  get locationData async => await getLocation();

  @override
  void dispose() {}
}
