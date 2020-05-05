import 'package:diarybootcamp/ui/styles.dart';
import 'package:diarybootcamp/ui/pages/map/map.dart';
import 'package:diarybootcamp/ui/pages/notes/notes.dart';
import 'package:diarybootcamp/ui/widgets/my_bottom_nav_bar.dart';
import 'package:diarybootcamp/ui/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
