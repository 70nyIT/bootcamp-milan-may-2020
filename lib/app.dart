import 'package:diarybootcamp/ui/pages/root/root.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'blocs/annotation_bloc/bloc.dart';
import 'blocs/page_bloc/page_bloc.dart';

/// First Widget attached to the screen
class DiAryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
        BlocProvider(create: (_) => AnnotationBloc()..add(LoadAnnotations())),
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
}
