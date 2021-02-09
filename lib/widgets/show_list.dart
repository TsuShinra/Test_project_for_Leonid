import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/box_item.dart';
import '../cubit/openbox_cubit.dart';
import '../cubit/filterboxes_cubit.dart';
import './block_item.dart';

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
                mediaQuery.padding.top) *
            0.7,
        child: ListView.builder(
            itemBuilder: (ctx, i) {
              return BlocBuilder<OpenboxCubit, OpenboxState>(
                builder: (context, state) {
                  return BlocBuilder<FilterBoxesCubit, FilterBoxesState>(
                    builder: (context, state) {
                      return GestureDetector(
                        onTap: () => BlocProvider.of<OpenboxCubit>(context)
                            .expandItem(boxes, i),
                        child: Container(
                          child: BlockItem(
                              title: boxes[i].title,
                              text: boxes[i].text,
                              expanded: boxes[i].expanded),
                        ),
                      );
                    },
                  );
                },
              );
            },
            itemCount: boxes.length));
  }
}