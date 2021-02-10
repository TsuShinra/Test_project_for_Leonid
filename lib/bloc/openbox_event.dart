part of 'openbox_bloc.dart';

abstract class OpenboxEvent extends Equatable {
  const OpenboxEvent();

  @override
  List<Object> get props => [];
}

class OpenBox extends OpenboxEvent {
  final List<BoxItem> boxes; 
  final int index;
  const OpenBox(this.boxes, this.index);
}
