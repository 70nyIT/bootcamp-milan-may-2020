import 'package:diarybootcamp/ui/widgets/my_card.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatefulWidget {
  @override
  _ServiceCardState createState() => _ServiceCardState();
}

class _ServiceCardState extends State<ServiceCard> {
  Color color;
  bool active;

  @override
  void initState() {
    super.initState();
    active = false;
    color = Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      duration: Duration(milliseconds: 300),
      tween: ColorTween(begin: Colors.white, end: color),
      builder: (BuildContext context, value, Widget child) {
        return MyCard(
          title: active ? 'Disattiva servizio' : 'Attiva servizio',
          description:
              'Mantenere il tracciamento attivo per il buon funzionamento dell\'app',
          iconData: Icons.gps_fixed,
          color: value,
          bottomButtons: <Widget>[
            RaisedButton(
              color: Theme.of(context).accentColor,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Text(
                active ? 'Disattiva' : 'Attiva',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                setState(() {
                  color = active ? Colors.white : Colors.orange;
                  active = !active;
                });
              },
            ),
          ],
        );
      },
    );
  }
}
