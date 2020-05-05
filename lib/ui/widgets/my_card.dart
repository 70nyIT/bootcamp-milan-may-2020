import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData iconData;

  const MyCard({
    Key key,
    @required this.title,
    @required this.description,
    @required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: Padding(
                    padding: EdgeInsets.only(right: 16, left: 8),
                    child: LayoutBuilder(
                      builder: (ctx, constraint) {
                        return Icon(
                          iconData,
                          size: constraint.maxWidth,
                        );
                      },
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    padding: EdgeInsets.only(right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(title,
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            style: Theme.of(context).textTheme.headline),
                        SizedBox(height: 8),
                        Text(
                          description,
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: RaisedButton(
                color: Theme.of(context).accentColor,
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Text(
                  'ATTIVA',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  print('Attiva');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
