import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  final int index;
  final DateTime dateTime;

  const NoteItem({Key key, @required this.index, @required this.dateTime})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.bookmark),
      title: Text('Nota: $index'),
      subtitle: Text(dateTime?.toIso8601String()),
    );
  }
}
