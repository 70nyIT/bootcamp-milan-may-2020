import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:diarybootcamp/models/my_location.dart';
import './bloc.dart';

class LocationBlocBloc extends Bloc<LocationBlocEvent, LocationBlocState> {
  LocationBlocBloc();

  @override
  LocationBlocState get initialState => InitialLocationBlocState();

  @override
  Stream<LocationBlocState> mapEventToState(
    LocationBlocEvent event,
  ) async* {
    if (event is LoadLocations) {
      final locations = await _getLocations();
      final currentState = state;
      if (currentState is InitialLocationBlocState) {
        yield LocationsLoaded(locations: locations);
      } else if (currentState is LocationsLoaded) {
        yield currentState.copyWith(locations: locations);
      }
    } else if (event is AddNewLocation) {
      final currentState = state;
      if (currentState is InitialLocationBlocState) {
        yield LocationsLoaded(locations: [event.location]);
      } else if (currentState is LocationsLoaded) {
        yield currentState
            .copyWith(locations: [...currentState.locations, event.location]);
      }
    }
  }

  _getLocations() async {
    await Future.delayed(Duration(seconds: 1));
    return <MyLocation>[];
  }
}
