import 'package:geolocator/geolocator.dart';

class Location {
  double? latitud;
  double? longitud;

  Future<void> getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.low),
      );

      latitud = position.latitude;
      longitud = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
