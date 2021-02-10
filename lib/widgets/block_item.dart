import 'package:flutter/material.dart';

import '../screens/more_screen.dart';

class BlockItem extends StatelessWidget {
  final String title;
  final String text;
  bool expanded;

  BlockItem({this.title, this.text, this.expanded});
  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 400,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
              child: Text(title, textAlign: TextAlign.center, style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            if (expanded)
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                  child: Column(children: <Widget>[
                    Container(
                      width: 400,
                        child: Text(text),
                    ),
                    RaisedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed(
                              MoreButtonScreen.routeName,
                              arguments: {'title': title, 'text': text});
                        },
                        child: Text('Подробнее...'))
                  ])),
          ],
        ));
  }
}
