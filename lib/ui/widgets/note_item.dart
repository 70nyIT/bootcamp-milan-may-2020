import 'package:diarybootcamp/models/annotation.dart';
import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final Annotation annotation;

  const NoteItem({Key key, @required this.annotation}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.bookmark),
      title: Text(annotation.text),
      subtitle: Text(annotation.dateTime.toIso8601String()),
    );
  }
}
