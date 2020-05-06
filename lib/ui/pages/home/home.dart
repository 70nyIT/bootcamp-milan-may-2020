import 'package:diarybootcamp/ui/styles.dart';
import 'package:diarybootcamp/ui/widgets/my_bottom_nav_bar.dart';
import 'package:diarybootcamp/ui/widgets/my_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final int annotationCount;

  const HomePage({Key key, this.annotationCount}) : super(key: key);
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
                          annotationCount.toString(),
                          style: TextStyles.standard,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          ServiceCard(),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

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
          onTap: () {
            setState(() {
              color = active ? Colors.white : Colors.orange;
              active = !active;
            });
          },
        );
      },
    );
  }
}
