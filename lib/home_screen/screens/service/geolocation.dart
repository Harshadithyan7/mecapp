import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';

Future<Position> currentLocation() async {
  bool servicePermission = await Geolocator.isLocationServiceEnabled();

  if (!servicePermission) {
    debugPrint('Location service not enabled....');
  }
  LocationPermission permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    debugPrint('Location permission denied.....');
    permission = await Geolocator.requestPermission();
  }
  debugPrint("geolocation found");
  return await Geolocator.getCurrentPosition();
}
