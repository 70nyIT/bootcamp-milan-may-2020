import 'package:diarybootcamp/ui/styles.dart';
import 'package:diarybootcamp/ui/pages/map/map.dart';
import 'package:diarybootcamp/ui/pages/notes/notes.dart';
import 'package:diarybootcamp/ui/widgets/my_bottom_nav_bar.dart';
import 'package:diarybootcamp/ui/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  final DateFormat dateFormat = DateFormat('dd MMM');

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
          icon: Icon(Icons.map),
          onPressed: () {
            _goToPage(context, MapPage());
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.bookmark_border),
            onPressed: () {
              _goToPage(context, NotesPage());
            },
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Image.asset('assets/diary_logo.png'),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Flexible(
                fit: FlexFit.tight,
                child: Center(
                    child: Column(
                  children: <Widget>[
                    Text('Campionamenti'),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '0',
                        style: TextStyles.standard,
                      ),
                    ),
                  ],
                )),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Text('Annotazioni'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '0',
                          style: TextStyles.standard,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          MyCard(
            title: 'Attiva servizio',
            description:
                'Mantenere il tracciamento attivo per il buon funzionamento dell\'app',
            iconData: Icons.gps_fixed,
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        tooltip: 'Aggiungi nota',
        child: Icon(Icons.add),
        onPressed: null,
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }

  _goToPage(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (BuildContext context) => widget),
    );
  }
}
