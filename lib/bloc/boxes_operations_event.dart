part of 'boxes_operations_bloc.dart';

abstract class BoxesOperationsEvent extends Equatable {
  const BoxesOperationsEvent();

  @override
  List<Object> get props => [];
}

class FilterBoxes extends BoxesOperationsEvent {
  final List<BoxItem> boxes;
  final String filter;
  FilterBoxes(this.boxes, this.filter);
}

class UnFilterBoxes extends BoxesOperationsEvent {
  final List<BoxItem> boxes;
  final String filter;
  UnFilterBoxes(this.boxes, this.filter);
}

class OpenBox extends BoxesOperationsEvent {
  final List<BoxItem> boxes; 
  final int index;
  const OpenBox(this.boxes, this.index);
}