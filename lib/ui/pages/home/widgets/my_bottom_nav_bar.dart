import 'package:diarybootcamp/ui/pages/settings/settings.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      child: Container(
        height: 60 + MediaQuery.of(context).padding.bottom,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 16,
                ),
                IconButton(
                  icon: Icon(Icons.cloud_queue),
                  tooltip: 'Invia i tuoi dati anonimi',
                  onPressed: () {
                    print('Send stats');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.local_hospital),
                  tooltip: "Notifica sanitaria... Coming soon!",
                  onPressed: () {
                    print('Call to action');
                  },
                ),
                IconButton(
                  icon: Icon(Icons.settings),
                  tooltip: "Impostazioni",
                  onPressed: () => _goToSettingsPage(context),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).padding.bottom,
            )
          ],
        ),
      ),
    );
  }

  _goToSettingsPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => SettingsPage(),
      ),
    );
  }
}
