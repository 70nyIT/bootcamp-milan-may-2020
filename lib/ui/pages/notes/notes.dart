import 'package:diarybootcamp/blocs/annotation_bloc/annotation_bloc.dart';
import 'package:diarybootcamp/blocs/annotation_bloc/annotation_bloc_state.dart';
import 'package:diarybootcamp/models/annotation.dart';
import 'package:diarybootcamp/ui/widgets/connection_widget.dart';
import 'package:diarybootcamp/ui/widgets/note_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        ConnectionWidget(),
        BlocBuilder<AnnotationBloc, AnnotationBlocState>(
          builder: (BuildContext context, state) {
            List<Annotation> annotations = [];
            if (state is AnnotationsLoaded) {
              annotations = state.annotations;
            }

            return Flexible(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: annotations.length,
                itemBuilder: (BuildContext context, int index) => NoteItem(
                  annotation: annotations[index],
                ),
              ),
            );
          },
        ),
      ],
    ));
  }
}
