import 'package:diarybootcamp/blocs/annotation_bloc/annotation_bloc.dart';
import 'package:diarybootcamp/blocs/annotation_bloc/annotation_bloc_event.dart';
import 'package:diarybootcamp/models/annotation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteItem extends StatelessWidget {
  final Annotation annotation;

  const NoteItem({Key key, @required this.annotation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.bookmark),
      title: Text(annotation.text),
      subtitle: Text(annotation.dateTime.toIso8601String()),
      trailing: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.red,
          onPressed: () {
            BlocProvider.of<AnnotationBloc>(context)
                .add(RemoveAnnotation(annotation));
          }),
    );
  }
}
