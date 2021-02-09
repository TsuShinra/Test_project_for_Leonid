import 'package:flutter/material.dart';


import '../screens/more_screen.dart';

class BlockItem extends StatefulWidget {
  final String title;
  final String text;
  bool expanded;

  BlockItem({this.title, this.text, this.expanded});

  @override
  _BlockItemState createState() => _BlockItemState();
}

class _BlockItemState extends State<BlockItem> {

  @override
  Widget build(BuildContext context) {
    return Card(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [Card(
                child: Text(widget.title),
              ),
            if (widget.expanded)
              GestureDetector(
                onTap: () {
                  setState(() {
                    widget.expanded = false;
                  });
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
                    child: Column(children: <Widget>[
                      Container(
                        child: SingleChildScrollView(
                          child: Text(widget.text),
                        ),
                      ),
                      RaisedButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(MoreButtonScreen.routeName, arguments: {'title': widget.title, 'text': widget.text});
                          },
                          child: Text('Подробнее...'))
                    ])),
              )
          ],
        ));
  }
}
