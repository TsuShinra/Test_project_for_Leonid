import 'package:Test_Project_for_L/cubit/getlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/build_boxes.dart';
import '../widgets/initial_build.dart';

class MainCubeScreen extends StatefulWidget {
  @override
  _MainCubeScreenState createState() => _MainCubeScreenState();
}

class _MainCubeScreenState extends State<MainCubeScreen> {
  TextEditingController _filterController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final appBar = AppBar(title: const Text('Test app. Fake API with Bloc'));

    return Scaffold(
        appBar: appBar,
        body: BlocConsumer<GetlistCubit, GetlistState>(
            listener: (context, state) {
          if (state is ListError) {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
              ),
            );
          }
        }, builder: (context, state) {
          if (state is GetlistInitial) {
            return InitialBuild();
          } else if (state is ListLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is ListLoaded) {
            return BuildBoxes(
                filterController: _filterController,
                mediaQuery: mediaQuery,
                appBar: appBar,
                boxes: state.boxes);
          } else if (state is ListError) {
            return InitialBuild();
          }
        }));
  }
}






