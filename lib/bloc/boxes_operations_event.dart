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

class UnFilterBoxes extends FilterBoxesEvent {
  final List<BoxItem> boxes;
  final String filter;
  UnFilterBoxes(this.boxes, this.filter);
}

class OpenBox extends FilterBoxesEvent {
  final List<BoxItem> boxes; 
  final int index;
  const OpenBox(this.boxes, this.index);
}