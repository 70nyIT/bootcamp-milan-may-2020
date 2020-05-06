import 'package:diarybootcamp/models/annotation.dart';
import 'package:diarybootcamp/ui/widgets/note_item.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  final List<Annotation> annotations;

  const NotesPage({Key key, @required this.annotations}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: annotations.length,
        itemBuilder: (BuildContext context, int index) => NoteItem(
          annotation: annotations[index],
        ),
      ),
    );
  }
}
