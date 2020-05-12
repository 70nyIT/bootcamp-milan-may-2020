import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:diarybootcamp/blocs/location_bloc/bloc.dart';
import 'package:diarybootcamp/services/location_service.dart';

enum ServiceStatus { Off, On }

class ServiceBloc extends Bloc<ServiceStatus, ServiceStatus> {
  final LocationService _locationService;
  final LocationBlocBloc _locationBlocBloc;
  Timer _timer;

  ServiceBloc(this._locationService, this._locationBlocBloc);

  @override
  ServiceStatus get initialState => ServiceStatus.Off;

  @override
  Stream<ServiceStatus> mapEventToState(
    ServiceStatus event,
  ) async* {
    if (event == ServiceStatus.Off) {
      stopService();
      yield event;
    } else {
      startService();
      yield event;
    }
  }

  startService() {
    print('startService');
    if (_timer != null && _timer.isActive) {
      _timer.cancel();
    }
    _timer = Timer.periodic(Duration(seconds: 30), (t) => getNewLocation());
  }

  stopService() {
    print('stopService');
    _timer?.cancel();
  }

  Future<void> getNewLocation() async {
    print('getNewLocation');
    final newLocation = await _locationService.getLocation();
    _locationBlocBloc.add(AddNewLocation(location: newLocation));
  }

  @override
  Future<void> close() {
    stopService();
    return super.close();
  }
}
