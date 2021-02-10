import 'package:Test_Project_for_L/screens/more_screen.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/boxes_operations_bloc.dart';
import './models/boxes_fakeAPI.dart';
import './bloc/getlist_bloc.dart';

import './screens/main_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test BLoc app',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(109, 89, 122, 1),
        accentColor: Color.fromRGBO(181, 101, 118, 1),
        cardColor: Color.fromRGBO(247, 209, 205, 0.8),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<GetlistBloc>(
            create: (BuildContext context) => GetlistBloc(FakeBoxesAPI()),            
          ),
          BlocProvider<BoxesOperationsBloc>(
            create: (BuildContext context) => BoxesOperationsBloc(),            
          ),
        ],
      child: MainCubeScreen(),
      ),
      routes: {MoreButtonScreen.routeName: (ctx) => MoreButtonScreen()},
    );
  }
}
