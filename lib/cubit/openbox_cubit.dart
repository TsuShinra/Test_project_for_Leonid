import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../models/box_item.dart';

part 'openbox_state.dart';

class OpenboxCubit extends Cubit<OpenboxState> {
  OpenboxCubit() : super(OpenboxInitial());

  void expandItem(List<BoxItem> boxes, int index) {
    if (boxes[index].expanded == false) {
      var indexOpen = boxes.indexWhere((box) => box.expanded);
      if (indexOpen >= 0) {
        boxes[indexOpen].expanded = false;
      }
      boxes[index].expanded = true;
    } else {
      boxes[index].expanded = false;
    }
    emit(OpenboxExpanded(boxes: boxes, index: index));
  }
}
