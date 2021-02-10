import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/getlist_bloc.dart';

class InitialBuild extends StatelessWidget {
  const InitialBuild();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        color: Theme.of(context).accentColor,
        onPressed: () {
          final weatherBloc = BlocProvider.of<GetlistBloc>(context);
          weatherBloc.add(GetList());
        },
        child: Text('Запросить данные'),
      ),
    );
  }
}