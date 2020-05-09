import 'package:equatable/equatable.dart';

abstract class LocationBlocState extends Equatable {
  const LocationBlocState();
}

class InitialLocationBlocState extends LocationBlocState {
  @override
  List<Object> get props => [];
}
