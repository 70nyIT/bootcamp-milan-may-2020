import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:diarybootcamp/blocs/connection_bloc/connection_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConnectionBloc, ConnectionStatus>(
      builder: (BuildContext context, state) {
        if (state == ConnectionStatus.Invisible) {
          return Container();
        }
        return Container(
          padding: const EdgeInsets.all(4.0),
          height: 30,
          width: double.infinity,
          color: state == ConnectionStatus.Disconnected
              ? Colors.red
              : Colors.green,
          alignment: Alignment.center,
          child: Text(
            state == ConnectionStatus.Disconnected
                ? 'Connessione assente! Funzionalità limitate'
                : 'Connessione ristabilita',
            style: TextStyle(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
