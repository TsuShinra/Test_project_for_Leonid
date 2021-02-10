import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/box_item.dart';

part 'openbox_event.dart';
part 'openbox_state.dart';

class OpenboxBloc extends Bloc<OpenboxEvent, OpenboxState> {
  
  OpenboxBloc() : super(OpenboxInitial());
  @override
  Stream<OpenboxState> mapEventToState(
    OpenboxEvent event,
  ) async* {
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
