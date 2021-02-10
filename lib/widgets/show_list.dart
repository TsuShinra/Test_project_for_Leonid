import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/box_item.dart';
import '../bloc/openbox_bloc.dart';
import './block_item.dart';
import './column_builder.dart';

class ShowList extends StatelessWidget {
  const ShowList({
    Key key,
    @required this.mediaQuery,
    @required this.appBar,
    @required this.boxes,
  }) : super(key: key);

  final MediaQueryData mediaQuery;
  final AppBar appBar;
  final List<BoxItem> boxes;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (mediaQuery.size.height -
              appBar.preferredSize.height -
              mediaQuery.padding.top) +
          0.9,
      child: BlocProvider(
          create: (BuildContext context) => OpenboxBloc(),
          child: BlocBuilder<OpenboxBloc, OpenboxState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: ColumnBuilder(
                  itemBuilder: (ctx, i) {
                    return GestureDetector(
                      onTap: () {
                        final openboxesBloc =
                            BlocProvider.of<OpenboxBloc>(context);
                        openboxesBloc.add(OpenBox(boxes, i));
                      },
                      child: Container(
                        child: BlockItem(
                            title: boxes[i].title,
                            text: boxes[i].text,
                            expanded: boxes[i].expanded,
                            filtered: boxes[i].filtered),
                      ),
                    );
                  },
                  itemCount: boxes.length,
                ),
              );
            },
          )),
    );
  }
}
