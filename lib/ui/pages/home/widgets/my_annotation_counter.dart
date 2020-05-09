import 'package:diarybootcamp/blocs/annotation_bloc/bloc.dart';
import 'package:diarybootcamp/blocs/page_bloc/page_bloc.dart';
import 'package:diarybootcamp/models/page_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../styles.dart';

class MyAnnotationsCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => BlocProvider.of<PageBloc>(context).add(Page.Notes),
        child: Column(
          children: <Widget>[
            Text('Annotazioni'),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: BlocBuilder<AnnotationBloc, AnnotationBlocState>(
                builder: (BuildContext context, state) {
                  String text;
                  if (state is AnnotationsLoaded) {
                    text = state.annotationCount.toString();
                  }
                  return Text(
                    text ?? '-',
                    style: TextStyles.standard,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
