import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/box_item.dart';
import '../bloc/filterboxes_bloc.dart';
import './show_list.dart';

class BuildBoxes extends StatelessWidget {
  const BuildBoxes({
    Key key,
    // @required TextEditingController filterController,
    @required this.mediaQuery,
    @required this.appBar,
    @required this.boxes,
  }) :
        // _filterController = filterController,
        super(key: key);

  // final TextEditingController _filterController;
  final MediaQueryData mediaQuery;
  final AppBar appBar;
  final List<BoxItem> boxes;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Container(
      child: Column(children: <Widget>[
        TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: 'Фильтровать данные',
            ),
            onTap: () {
              _controller.text = '';
              final filterBoxesBloc = BlocProvider.of<FilterBoxesBloc>(context);
              filterBoxesBloc.add(UnFilterBoxes(boxes, _controller.text));
            },
            onChanged: (result) {
              final filterBoxesBloc = BlocProvider.of<FilterBoxesBloc>(context);
              filterBoxesBloc.add(FilterBoxes(boxes, result));
            }),
        ShowList(mediaQuery: mediaQuery, appBar: appBar, boxes: boxes)
      ]),
    );
  }
}
