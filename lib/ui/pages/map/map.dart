import 'dart:async';

import 'package:diarybootcamp/blocs/location_bloc/bloc.dart';
import 'package:diarybootcamp/blocs/service_bloc/service_bloc.dart';
import 'package:diarybootcamp/models/my_location.dart';
import 'package:diarybootcamp/services/location_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  Set<Marker> markers = <Marker>{};

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
          BlocListener<LocationBlocBloc, LocationBlocState>(
            listener: (BuildContext context, state) {
              if (state is LocationsLoaded) {
                final list = state.locations;
                if (list.isNotEmpty) {
                  setState(() {
                    this.markers =
                        Set<Marker>.from(list.map((l) => _buildMarker(l)));
                  });
                  _goToLocation(list.last);
                }
              }
            },
            child: GoogleMap(
              myLocationButtonEnabled: false,
              initialCameraPosition: initialCameraPosition,
              onMapCreated: _onMapCreated,
              markers: markers,
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Card(
              child: IconButton(
                icon: Icon(Icons.gps_fixed),
                onPressed: () =>
                    BlocProvider.of<ServiceBloc>(context).getNewLocation(),
              ),
            ),
          )
        ],
      ),
    );
  }

  _buildMarker(MyLocation location) {
    final markerId = MarkerId('markerId_${markers.length}');
    final marker = Marker(
      markerId: markerId,
      position: LatLng(location.lat, location.long),
    );
    return marker;
  }

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  Future<void> _goToLocation(MyLocation location) async {
    final GoogleMapController controller = await _controller.future;
    await controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: LatLng(location.lat, location.long), zoom: 15),
      ),
    );
  }
}
