part of 'filterboxes_bloc.dart';

abstract class FilterBoxesState extends Equatable {
  final List<BoxItem> boxes;
  final String filter;
  const FilterBoxesState({this.boxes, this.filter});

  @override
  List<Object> get props => [boxes];
}

class FilterBoxesInitial extends FilterBoxesState {
  const FilterBoxesInitial({List<BoxItem> boxes, String filter})
      : super(boxes: boxes, filter: filter);
}

class FilteredBoxes extends FilterBoxesState {
  const FilteredBoxes({List<BoxItem> boxes, String filter})
      : super(boxes: boxes, filter: filter);
}

class UnFilteredBoxes extends FilterBoxesState {
  const UnFilteredBoxes({List<BoxItem> boxes, String filter})
      : super(boxes: boxes, filter: filter);
}

class OpenboxExpanded extends FilterBoxesState {
  const OpenboxExpanded({List<BoxItem> boxes})
      : super(boxes: boxes,);
}

class OpenboxClosed extends FilterBoxesState {
  const OpenboxClosed({List<BoxItem> boxes})
      : super(boxes: boxes);
}

class OtherBoxesClosed extends FilterBoxesState {
  final int index;
  final int closedIndex;
  const OtherBoxesClosed({List<BoxItem> boxes, this.index, this.closedIndex})
      : super(boxes: boxes,);
}