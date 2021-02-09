part of 'openbox_cubit.dart';

@immutable
abstract class OpenboxState extends Equatable {
  final List<BoxItem> boxes;
  final int index;
  const OpenboxState({this.boxes, this.index});

  @override
  List<Object> get props => [boxes, index];
}


class OpenboxInitial extends OpenboxState {
  const OpenboxInitial({List<BoxItem> boxes, int index})
      : super(boxes: boxes, index: index);
}

class OpenboxExpanded extends OpenboxState {
  const OpenboxExpanded({List<BoxItem> boxes, int index})
      : super(boxes: boxes, index: index);
}
