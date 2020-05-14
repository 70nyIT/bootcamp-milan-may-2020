import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:data_connection_checker/data_connection_checker.dart';

enum ConnectionStatus { Connected, Disconnected, Invisible }

class ConnectionBloc extends Bloc<ConnectionStatus, ConnectionStatus> {
  ConnectionBloc() {
    DataConnectionChecker().onStatusChange.listen((status) {
      add(status == DataConnectionStatus.connected
          ? ConnectionStatus.Connected
          : ConnectionStatus.Disconnected);
    });
  }

  @override
  ConnectionStatus get initialState => ConnectionStatus.Invisible;

  @override
  Stream<ConnectionStatus> mapEventToState(
    ConnectionStatus event,
  ) async* {
    yield event;
    if (event == ConnectionStatus.Connected) {
      Timer(Duration(seconds: 2), () {
        add(ConnectionStatus.Invisible);
      });
    }
  }
}
