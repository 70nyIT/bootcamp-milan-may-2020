import 'package:diarybootcamp/blocs/annotation_bloc/bloc.dart';
import 'package:diarybootcamp/blocs/page_bloc/page_bloc.dart';
import 'package:diarybootcamp/models/page_enum.dart';
import 'package:diarybootcamp/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../home/home.dart';
import '../map/map.dart';
import '../notes/notes.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  DateFormat dateFormat;
  int _sampleCount = 0;

  @override
  void initState() {
    print('initState');
    super.initState();
    dateFormat = DateFormat('dd MMM');
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageBloc, Page>(
      builder: (BuildContext context, Page state) {
        final _index = state.index;
        return Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(Icons.event),
                SizedBox(
                  width: 4,
                ),
                Text(
                  dateFormat.format(DateTime.now()),
                ),
              ],
            ),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(_index == 0 ? Icons.map : Icons.arrow_back_ios),
              onPressed: () {
                BlocProvider.of<PageBloc>(context)
                    .add(_index == 0 ? Page.Map : Page.Home);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(_index == 0 ? Icons.bookmark_border : Icons.search),
                onPressed: () {
                  if (_index != 0) return;
                  BlocProvider.of<PageBloc>(context).add(Page.Notes);
                },
              ),
            ],
          ),
          body: IndexedStack(
            index: state.index,
            children: <Widget>[
              HomePage(
                sampleCount: _sampleCount,
              ),
              MapPage(
                onNewLocationAdded: _updateSampleCounter,
              ),
              NotesPage(),
            ],
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 0.0),
            child: FloatingActionButton(
              tooltip: 'Aggiungi nota',
              child: Icon(Icons.add),
              onPressed: () => _addAnnotation(context),
            ),
          ),
        );
      },
    );
  }

  _addAnnotation(BuildContext context) async {
    TextEditingController _controller = TextEditingController();
    await Alert(
      context: context,
      title: 'Nuova annotazione',
      content: TextField(
        controller: _controller,
        maxLines: 5,
        decoration: InputDecoration.collapsed(
          hintText: 'Scrivi qui',
          filled: true,
          fillColor: Colors.blueGrey.shade200,
        ),
      ),
      buttons: [
        DialogButton(
          child: Text(
            'Annulla',
            style: TextStyles.standard.white,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        DialogButton(
          child: Text(
            'Salva',
            style: TextStyles.standard.white,
          ),
          onPressed: () {
            final note = _controller.text.trim();
            if (note.isEmpty) return;
            BlocProvider.of<AnnotationBloc>(context)
                .add(AddAnnotation(note: note, dateTime: DateTime.now()));
            Navigator.of(context).pop();
          },
        ),
      ],
    ).show();
  }

  _updateSampleCounter() {
    setState(() {
      _sampleCount++;
    });
  }
}
