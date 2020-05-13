import 'package:diarybootcamp/blocs/login_bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Impostazioni'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text('SignOut'),
            onTap: () {
              BlocProvider.of<LoginBloc>(context).add(SignOut());
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
