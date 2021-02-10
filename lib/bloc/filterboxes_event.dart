part of 'filterboxes_bloc.dart';

abstract class FilterBoxesEvent extends Equatable {
  const FilterBoxesEvent();

  @override
  List<Object> get props => [];
}

class FilterBoxes extends FilterBoxesEvent {
  final List<BoxItem> boxes;
  final String filter;
  FilterBoxes(this.boxes, this.filter);
}