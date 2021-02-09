part of 'filterboxes_cubit.dart';


@immutable
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
