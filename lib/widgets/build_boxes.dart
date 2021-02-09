import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/box_item.dart';
import '../cubit/filterboxes_cubit.dart';
import './show_list.dart';

class BuildBoxes extends StatelessWidget {
  const BuildBoxes({
    Key key,
    @required TextEditingController filterController,
    @required this.mediaQuery,
    @required this.appBar,
    @required this.boxes,
  })  : _filterController = filterController,
        super(key: key);

  final TextEditingController _filterController;
  final MediaQueryData mediaQuery;
  final AppBar appBar;
  final List<BoxItem> boxes;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: <Widget>[
        TextField(
          controller: _filterController,
          decoration: InputDecoration(
            hintText: 'Фильтровать данные',
          ),
          onTap: () {
            _filterController.text = '';
            BlocProvider.of<FilterBoxesCubit>(context)
                .filterBoxes(_filterController.text, boxes);
          },
          onChanged: (result) => BlocProvider.of<FilterBoxesCubit>(context)
              .filterBoxes(result, boxes),
        ),
        BlocBuilder<FilterBoxesCubit, FilterBoxesState>(
          builder: (context, state) {
            if (state is FilterBoxesInitial) {
              return ShowList(
                  mediaQuery: mediaQuery, appBar: appBar, boxes: boxes);
            } else if (state is FilteredBoxes) {
              return ShowList(
                  mediaQuery: mediaQuery, appBar: appBar, boxes: state.boxes);
            }
          },
        )
      ]),
    );
  }
}