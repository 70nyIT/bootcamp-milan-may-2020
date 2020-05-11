import 'package:diarybootcamp/blocs/location_bloc/bloc.dart';
import 'package:diarybootcamp/blocs/service_bloc/service_bloc.dart';
import 'package:diarybootcamp/services/location_service.dart';
import 'package:diarybootcamp/ui/pages/root/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/annotation_bloc/bloc.dart';
import 'blocs/page_bloc/page_bloc.dart';

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
        BlocProvider(
            create: (_) => ServiceBloc(LocationService(), _locationBlocBloc)),
        BlocProvider(create: (_) => PageBloc()),
        BlocProvider(create: (_) => AnnotationBloc()..add(LoadAnnotations())),
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
        home: RootPage(),
      ),
    );
  }

  @override
  void dispose() {
    _locationBlocBloc.close();
    super.dispose();
  }
}
