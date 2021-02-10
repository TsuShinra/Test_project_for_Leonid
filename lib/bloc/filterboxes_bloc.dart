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
      List<BoxItem> filteredBoxes = event.boxes;
      filteredBoxes = event.boxes
          .where((boxes) =>
              (boxes.title.toLowerCase().contains(event.filter.toLowerCase())))
          .toList();
      yield (FilteredBoxes(boxes: filteredBoxes, filter: event.filter));
    }
  }
}
