import 'package:diarybootcamp/models/my_location.dart';
import 'package:equatable/equatable.dart';

abstract class LocationBlocState extends Equatable {
  const LocationBlocState();
}

class InitialLocationBlocState extends LocationBlocState {
  @override
  List<Object> get props => [];
}

class LocationsLoaded extends LocationBlocState {
  final List<MyLocation> locations;

  LocationsLoaded({this.locations});

  int get annotationCount => locations.length;

  LocationsLoaded copyWith({
    List<MyLocation> locations,
  }) {
    return LocationsLoaded(
      locations: locations ?? this.locations,
    );
  }

  @override
  List<Object> get props => [locations];
}
