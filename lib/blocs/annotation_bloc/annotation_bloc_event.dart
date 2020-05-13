import 'package:diarybootcamp/models/annotation.dart';
import 'package:equatable/equatable.dart';

abstract class AnnotationBlocEvent extends Equatable {
  const AnnotationBlocEvent();
}

class AddAnnotation extends AnnotationBlocEvent {
  final Annotation annotation;

  AddAnnotation(this.annotation);

  @override
  List<Object> get props => [annotation];
}

class LoadAnnotations extends AnnotationBlocEvent {
  @override
  List<Object> get props => [];
}

class RemoveAnnotation extends AnnotationBlocEvent {
  final Annotation annotation;

  RemoveAnnotation(this.annotation);
  @override
  List<Object> get props => [annotation];
}

class StartAnnotationService extends AnnotationBlocEvent {
  StartAnnotationService();
  @override
  List<Object> get props => [];
}

class UpdateAnnotations extends AnnotationBlocEvent {
  final List<Annotation> annotations;

  UpdateAnnotations(this.annotations);
  @override
  List<Object> get props => [annotations];
}
