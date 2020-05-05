import 'package:diarybootcamp/ui/widgets/note_item.dart';
import 'package:flutter/material.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Note'),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 60,
        itemBuilder: (BuildContext context, int index) => NoteItem(
          dateTime: DateTime.now(),
          index: index,
        ),
      ),
    );
  }
}
