import 'package:diarybootcamp/ui/styles.dart';
import 'package:diarybootcamp/ui/pages/home/widgets/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/service_card.dart';

class HomePage extends StatelessWidget {
  final int annotationCount;
  final int sampleCount;

  const HomePage({Key key, this.annotationCount, this.sampleCount})
      : super(key: key);
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
                        sampleCount.toString(),
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
