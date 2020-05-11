import 'package:diarybootcamp/ui/pages/home/widgets/my_sample_counter.dart';
import 'package:diarybootcamp/ui/styles.dart';
import 'package:diarybootcamp/ui/pages/home/widgets/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

import 'widgets/my_annotation_counter.dart';
import 'widgets/service_card.dart';

class HomePage extends StatelessWidget {
  final int sampleCount;

  const HomePage({Key key, this.sampleCount}) : super(key: key);
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
                child: MySampleCounter(),
              ),
              Flexible(fit: FlexFit.tight, child: MyAnnotationsCounter()),
            ],
          ),
          ServiceCard(),
        ],
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
