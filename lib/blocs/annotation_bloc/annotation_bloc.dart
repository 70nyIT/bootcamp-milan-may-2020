import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:diarybootcamp/repositories/annotation_repository.dart';
import 'package:diarybootcamp/models/annotation.dart';
import './bloc.dart';

class AnnotationBloc extends Bloc<AnnotationBlocEvent, AnnotationBlocState> {
  final AnnotationRepository annotationRepository;

  StreamSubscription subscription;

  AnnotationBloc(this.annotationRepository);

  @override
  AnnotationBlocState get initialState => InitialAnnotationBlocState();

  @override
  Stream<AnnotationBlocState> mapEventToState(
    AnnotationBlocEvent event,
  ) async* {
    if (event is AddAnnotation) {
      await annotationRepository.addAnnotation(event.annotation);

      // se usiamo lo stream non serve aggiornare la lista
//      final currentState = state;
//      if (currentState is InitialAnnotationBlocState) {
//        yield AnnotationsLoaded(annotations: [event.annotation]);
//      } else if (currentState is AnnotationsLoaded) {
//        yield currentState.copyWith(
//            annotations: [...currentState.annotations, event.annotation]);
//      }
    } else if (event is LoadAnnotations) {
      final annotations = await _getAnnotations();
      final currentState = state;
      if (currentState is InitialAnnotationBlocState) {
        yield AnnotationsLoaded(annotations: annotations);
      } else if (currentState is AnnotationsLoaded) {
        yield currentState.copyWith(annotations: annotations);
      }
    } else if (event is RemoveAnnotation) {
      await annotationRepository.deleteAnnotation(event.annotation);

      // se usiamo lo stream non serve aggiornare la lista
//      final currentState = state as AnnotationsLoaded;
//      final updatedList = List<Annotation>.from(currentState.annotations);
//      updatedList.removeWhere((a) => a.id == event.annotation.id);
//      yield currentState.copyWith(annotations: updatedList);
    } else if (event is StartAnnotationService) {
      subscription =
          annotationRepository.getAllNotesStream().listen((annotations) {
        add(UpdateAnnotations(annotations));
      });
    } else if (event is UpdateAnnotations) {
      yield AnnotationsLoaded(annotations: event.annotations);
    }
  }

  Future<List<Annotation>> _getAnnotations() async {
    return await annotationRepository.getAllNotes();
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
