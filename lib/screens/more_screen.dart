import 'package:flutter/material.dart';

class MoreButtonScreen extends StatelessWidget {
  static const routeName = '/more-screen';

  @override
  Widget build(BuildContext context) {
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final title = routeArgs['title'];
    final text = routeArgs['text'];
    return Scaffold(
      appBar: AppBar(title: const Text('Information from the bloc')),
      body: Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Text(title),
            Divider(),
            Text(text)
          ]
      )),
    )
    );    
  }
}