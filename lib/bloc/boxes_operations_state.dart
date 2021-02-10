part of 'boxes_operations_bloc.dart';

abstract class BoxesOperationsState extends Equatable {
  final List<BoxItem> boxes;
  final String filter;
  const BoxesOperationsState({this.boxes, this.filter});

  @override
  List<Object> get props => [boxes];
}

class BoxesOperationsInitial extends BoxesOperationsState {
  const BoxesOperationsInitial({List<BoxItem> boxes, String filter})
      : super(boxes: boxes, filter: filter);
}

class FilteredBoxes extends BoxesOperationsState {
  const FilteredBoxes({List<BoxItem> boxes, String filter})
      : super(boxes: boxes, filter: filter);
}

class UnFilteredBoxes extends BoxesOperationsState {
  const UnFilteredBoxes({List<BoxItem> boxes, String filter})
      : super(boxes: boxes, filter: filter);
}

class OpenboxExpanded extends BoxesOperationsState {
  const OpenboxExpanded({List<BoxItem> boxes})
      : super(boxes: boxes,);
}

class OpenboxClosed extends BoxesOperationsState {
  const OpenboxClosed({List<BoxItem> boxes})
      : super(boxes: boxes);
}

class OtherBoxesClosed extends BoxesOperationsState {
  final int index;
  final int closedIndex;
  const OtherBoxesClosed({List<BoxItem> boxes, this.index, this.closedIndex})
      : super(boxes: boxes,);
}