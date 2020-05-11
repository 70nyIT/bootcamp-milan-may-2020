import 'dart:async';
import 'package:diarybootcamp/models/my_location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationService {
  final location = Location();
  PermissionStatus _permissionGranted;
  bool _serviceEnabled;
  LocationService() {
    location.requestPermission();
  }

  Future<MyLocation> getLocation() async {
    try {
      if (await _checkPermissions()) {
        var userLocation = await location.getLocation();
        return MyLocation(
            lat: userLocation.latitude,
            long: userLocation.longitude,
            dateTime: DateTime.now());
      }
      await _requestPermission();
      return null;
    } on Exception catch (e) {
      print('Could not get location: ${e.toString()}');
      return null;
    }
  }

  Future<bool> _checkPermissions() async {
    final PermissionStatus permissionGrantedResult =
        await location.hasPermission();
    return permissionGrantedResult == PermissionStatus.granted;
  }

  Future<void> _requestPermission() async {
    if (_permissionGranted != PermissionStatus.granted) {
      final PermissionStatus permissionRequestedResult =
          await location.requestPermission();
      _permissionGranted = permissionRequestedResult;
      if (permissionRequestedResult != PermissionStatus.granted) {
        return;
      }
    }
  }

  Future<void> _checkService() async {
    final bool serviceEnabledResult = await location.serviceEnabled();
    _serviceEnabled = serviceEnabledResult;
  }

  Future<void> _requestService() async {
    if (_serviceEnabled == null || !_serviceEnabled) {
      final bool serviceRequestedResult = await location.requestService();

      _serviceEnabled = serviceRequestedResult;
      if (!serviceRequestedResult) {
        return;
      }
    }
  }
}
