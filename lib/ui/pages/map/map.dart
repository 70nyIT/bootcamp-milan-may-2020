import 'dart:async';

import 'package:diarybootcamp/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  final Function onNewLocationAdded;

  const MapPage({Key key, this.onNewLocationAdded}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  CameraPosition initialCameraPosition;
  LocationService locationService;
  Completer<GoogleMapController> _controller = Completer();
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  @override
  void initState() {
    super.initState();
    locationService = LocationService();
    initialCameraPosition = CameraPosition(target: LatLng(0, 0));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          GoogleMap(
            myLocationButtonEnabled: false,
            initialCameraPosition: initialCameraPosition,
            onMapCreated: _onMapCreated,
            markers: Set<Marker>.of(markers.values),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Card(
              child: IconButton(
                icon: Icon(Icons.gps_fixed),
                onPressed: _onGetNewLocationTap,
              ),
            ),
          )
        ],
      ),
    );
  }

  _onGetNewLocationTap() async {
    final newLoc = await locationService.getLocation();
    if (newLoc != null) {
      _addMarker(newLoc);
      _goToLocation(newLoc);
      widget.onNewLocationAdded();
    }
  }

  _addMarker(LatLng location) {
    final markerId = MarkerId('markerId_${markers.length}');
    final marker = Marker(
      markerId: markerId,
      position: location,
    );
    setState(() {
      markers[markerId] = marker;
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<void> _goToLocation(LatLng location) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: location, zoom: 15),
      ),
    );
  }
}
