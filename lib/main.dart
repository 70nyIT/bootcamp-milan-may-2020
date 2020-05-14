import 'package:bloc/bloc.dart';
import 'package:diarybootcamp/models/annotation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';

class MyBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    super.onEvent(bloc, event);
//    print(event);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    print(error);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

/// Entry point
void main() async {
  BlocSupervisor.delegate = MyBlocDelegate();
  await Hive.initFlutter();
  Hive.registerAdapter(AnnotationAdapter());
  await Hive.openBox<Annotation>('annotations');
  runApp(DiAryApp());
}
