import 'package:diarybootcamp/blocs/service_bloc/service_bloc.dart';
import 'package:diarybootcamp/ui/widgets/my_button.dart';
import 'package:diarybootcamp/ui/widgets/my_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            MyButton(
              text: active ? 'Disattiva' : 'Attiva',
              onPressed: () {
                if (active) {
                  BlocProvider.of<ServiceBloc>(context).stopService();
                } else {
                  BlocProvider.of<ServiceBloc>(context).startService();
                }

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
