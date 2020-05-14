import 'package:diarybootcamp/blocs/connection_bloc/connection_bloc.dart';
import 'package:diarybootcamp/blocs/login_bloc/bloc.dart';
import 'package:diarybootcamp/repositories/annotation_repository.dart';
import 'package:diarybootcamp/blocs/location_bloc/bloc.dart';
import 'package:diarybootcamp/blocs/service_bloc/service_bloc.dart';
import 'package:diarybootcamp/repositories/login_repository.dart';
import 'package:diarybootcamp/services/location_service.dart';
import 'package:diarybootcamp/ui/pages/login/login_page.dart';
import 'package:diarybootcamp/ui/pages/root/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';

import 'blocs/annotation_bloc/bloc.dart';
import 'blocs/page_bloc/page_bloc.dart';
import 'models/annotation.dart';

/// First Widget attached to the screen
class DiAryApp extends StatefulWidget {
  @override
  _DiAryAppState createState() => _DiAryAppState();
}

class _DiAryAppState extends State<DiAryApp> {
  LocationBlocBloc _locationBlocBloc;
  @override
  void initState() {
    super.initState();
    _locationBlocBloc = LocationBlocBloc()..add(LoadLocations());
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ConnectionBloc>(create: (_) => ConnectionBloc()),
        BlocProvider<LoginBloc>(
          create: (_) =>
              LoginBloc(LoginRepositoryImpl())..add(CheckCurrentUser()),
        ),
        BlocProvider<ServiceBloc>(
            create: (_) => ServiceBloc(LocationService(), _locationBlocBloc)),
        BlocProvider<PageBloc>(create: (_) => PageBloc()),
        BlocProvider<AnnotationBloc>(
          create: (_) => AnnotationBloc(
            AnnotationRepositoryImpl(Hive.box<Annotation>('annotations')),
          ),
        ),
        BlocProvider.value(
          value: _locationBlocBloc,
        ),
      ],
      child: MaterialApp(
          title: 'DiAry Bootcamp',
          theme: ThemeData(
            primaryColor: Colors.white,
            accentColor: Colors.blueGrey,
          ),
          home: AuthPage()),
    );
  }

  @override
  void dispose() {
    _locationBlocBloc.close();
    super.dispose();
  }
}

class AuthPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (BuildContext context, state) {
        if (state is Authenticated) {
          BlocProvider.of<AnnotationBloc>(context)
              .add(StartAnnotationService());
        }
      },
      builder: (BuildContext context, state) {
        if (state is Authenticated) {
          return RootPage();
        } else if (state is Unauthenticated) {
          return LoginPage();
        }
        return Icon(Icons.error);
      },
    );
  }
}
