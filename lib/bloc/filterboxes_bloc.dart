import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/box_item.dart';

part 'filterboxes_event.dart';
part 'filterboxes_state.dart';

class FilterBoxesBloc extends Bloc<FilterBoxesEvent, FilterBoxesState> {
  FilterBoxesBloc() : super(FilterBoxesInitial());

  @override
  Stream<FilterBoxesState> mapEventToState(
    FilterBoxesEvent event,
  ) async* {
    if (event is FilterBoxes) {
      // List<BoxItem> filteredBoxes = event.boxes;
      event.boxes.forEach((element) {
        if (!element.title.toLowerCase().contains(event.filter.toLowerCase())) {
          print(element.title);
          element.filtered = true;
          print(element.filtered);
        } else {
          element.filtered = false;
        }
      });
      print(event.boxes[1].filtered);
      // filteredBoxes = event.boxes
      //     .where((boxes) =>
      //         (boxes.title.toLowerCase().contains(event.filter.toLowerCase())))
      //     .toList();
      yield (FilteredBoxes(boxes: event.boxes, filter: event.filter));
    }
  }
}
