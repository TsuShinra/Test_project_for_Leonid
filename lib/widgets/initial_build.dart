import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/getlist_cubit.dart';

class InitialBuild extends StatelessWidget {
  const InitialBuild();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RaisedButton(
        color: Theme.of(context).accentColor,
        onPressed: () {
          final weatherCubit = BlocProvider.of<GetlistCubit>(context);
          weatherCubit.getBoxes();
        },
        child: Text('Запросить данные'),
      ),
    );
  }
}