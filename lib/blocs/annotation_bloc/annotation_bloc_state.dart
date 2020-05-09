import 'package:diarybootcamp/models/annotation.dart';
import 'package:equatable/equatable.dart';

abstract class AnnotationBlocState extends Equatable {
  const AnnotationBlocState();
}

class InitialAnnotationBlocState extends AnnotationBlocState {
  @override
  List<Object> get props => [];
}

class AnnotationsLoaded extends AnnotationBlocState {
  final List<Annotation> annotations;

  AnnotationsLoaded({this.annotations});

  int get annotationCount => annotations.length;

  AnnotationsLoaded copyWith({
    List<Annotation> annotations,
  }) {
    return AnnotationsLoaded(
      annotations: annotations ?? this.annotations,
    );
  }

  @override
  List<Object> get props => [annotations];
}
