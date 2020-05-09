import 'package:diarybootcamp/models/annotation.dart';
import 'package:equatable/equatable.dart';

abstract class AnnotationBlocEvent extends Equatable {
  const AnnotationBlocEvent();
}

class AddAnnotation extends AnnotationBlocEvent {
  final String note;
  final DateTime dateTime;

  AddAnnotation({this.note, this.dateTime});

  @override
  List<Object> get props => [note, dateTime];
}

class LoadAnnotations extends AnnotationBlocEvent {
  @override
  List<Object> get props => [];
}
