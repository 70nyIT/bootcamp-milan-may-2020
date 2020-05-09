import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class LocationBlocBloc extends Bloc<LocationBlocEvent, LocationBlocState> {
  @override
  LocationBlocState get initialState => InitialLocationBlocState();

  @override
  Stream<LocationBlocState> mapEventToState(
    LocationBlocEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
