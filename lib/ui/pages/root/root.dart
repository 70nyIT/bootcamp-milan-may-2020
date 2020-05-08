import 'package:diarybootcamp/models/annotation.dart';
import 'package:diarybootcamp/models/page_enum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../home/home.dart';
import '../map/map.dart';
import '../notes/notes.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  DateFormat dateFormat;
  int _index;
  List<Annotation> _annotations;
  int _sampleCount = 0;

  @override
  void initState() {
    print('initState');
    super.initState();
    dateFormat = DateFormat('dd MMM');
    _index = 0;
    _annotations = [];
  }

  _incrementAnnotation() {
    setState(() {
      _annotations.add(Annotation('Prova', DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
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
            _changePage(_index == 0 ? Page.Map : Page.Home);
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(_index == 0 ? Icons.bookmark_border : Icons.search),
            onPressed: () {
              if (_index != 0) return;
              _changePage(Page.Notes);
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _index,
        children: <Widget>[
          HomePage(
            annotationCount: _annotations.length,
            sampleCount: _sampleCount,
          ),
          MapPage(
            onNewLocationAdded: _updateSampleCounter,
          ),
          NotesPage(
            annotations: _annotations,
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(
          tooltip: 'Aggiungi nota',
          child: Icon(Icons.add),
          onPressed: _incrementAnnotation,
        ),
      ),
    );
  }

  _changePage(Page page) {
    print('_changePage');
    if (_index == page.index) return;
    setState(() {
      _index = page.index;
    });
  }

  _updateSampleCounter() {
    setState(() {
      _sampleCount++;
    });
  }
}
