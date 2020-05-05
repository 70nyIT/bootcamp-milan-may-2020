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
  IconData leadingIcon;
  @override
  void initState() {
    super.initState();
    dateFormat = DateFormat('dd MMM');
    _index = 0;
    leadingIcon = Icons.map;
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
              _changePage(Page.Notes);
            },
          ),
        ],
      ),
      body: IndexedStack(
        index: _index,
        children: <Widget>[
          HomePage(),
          MapPage(),
          NotesPage(),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: FloatingActionButton(
          tooltip: 'Aggiungi nota',
          child: Icon(Icons.add),
          onPressed: null,
        ),
      ),
    );
  }

  _changePage(Page page) {
    if (_index == page.index) return;
    setState(() {
      _index = page.index;
    });
  }
}
