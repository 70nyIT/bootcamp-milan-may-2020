import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:diarybootcamp/models/annotation.dart';
import './bloc.dart';

class AnnotationBloc extends Bloc<AnnotationBlocEvent, AnnotationBlocState> {
  @override
  AnnotationBlocState get initialState => InitialAnnotationBlocState();

  @override
  Stream<AnnotationBlocState> mapEventToState(
    AnnotationBlocEvent event,
  ) async* {
    if (event is AddAnnotation) {
      final currentState = state;
      final annotation = Annotation(event.note, event.dateTime);
      if (currentState is InitialAnnotationBlocState) {
        yield AnnotationsLoaded(annotations: [annotation]);
      } else if (currentState is AnnotationsLoaded) {
        yield currentState
            .copyWith(annotations: [...currentState.annotations, annotation]);
      }
    } else if (event is LoadAnnotations) {
      final annotations = await _getAnnotations();
      final currentState = state;
      if (currentState is InitialAnnotationBlocState) {
        yield AnnotationsLoaded(annotations: annotations);
      } else if (currentState is AnnotationsLoaded) {
        yield currentState.copyWith(annotations: annotations);
      }
    }
  }

  Future<List<Annotation>> _getAnnotations() async {
    await Future.delayed(Duration(seconds: 1));
    return <Annotation>[];
  }
}
