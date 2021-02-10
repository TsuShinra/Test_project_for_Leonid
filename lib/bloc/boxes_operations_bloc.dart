import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/box_item.dart';

part 'boxes_operations_event.dart';
part 'boxes_operations_state.dart';

class BoxesOperationsBloc extends Bloc<BoxesOperationsEvent, BoxesOperationsState> {
  BoxesOperationsBloc() : super(BoxesOperationsInitial());

  @override
  Stream<BoxesOperationsState> mapEventToState(
    BoxesOperationsEvent event,
  ) async* {
    if (event is FilterBoxes) {
      event.boxes.forEach((element) {
        if (!element.title.toLowerCase().contains(event.filter.toLowerCase())) {
          element.filtered = true;
        } else {
          element.filtered = false;
        }
      });
      yield (FilteredBoxes(boxes: event.boxes, filter: event.filter));
      yield(UnFilteredBoxes(boxes: event.boxes, filter: event.filter));
    }
    if(event is UnFilterBoxes) {
      event.boxes.forEach((element) {element.filtered = false;});
      yield(UnFilteredBoxes(boxes: event.boxes, filter: event.filter));
    }
    if (event is OpenBox) {
      var indexOpen = event.boxes.indexWhere((box) => box.expanded);
      if (event.boxes[event.index].expanded == false) {
        if (indexOpen >= 0) {
          event.boxes[indexOpen].expanded = false;
          yield (OtherBoxesClosed(
              boxes: event.boxes, index: event.index, closedIndex: indexOpen));
        }
        event.boxes[event.index].expanded = true;
        yield (OpenboxExpanded(boxes: event.boxes));
      } else if (event.boxes[event.index].expanded == true) {
        event.boxes[event.index].expanded = false;
        yield (OpenboxClosed(boxes: event.boxes));
      }
    }
  }
}
