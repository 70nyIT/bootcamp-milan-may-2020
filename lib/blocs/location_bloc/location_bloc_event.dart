import 'package:diarybootcamp/models/my_location.dart';
import 'package:equatable/equatable.dart';

abstract class LocationBlocEvent extends Equatable {
  const LocationBlocEvent();
}

class AddNewLocation extends LocationBlocEvent {
  final MyLocation location;

  AddNewLocation({this.location});

  @override
  List<Object> get props => [location];
}

class LoadLocations extends LocationBlocEvent {
  @override
  List<Object> get props => [];
}
