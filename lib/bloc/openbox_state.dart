part of 'openbox_bloc.dart';

abstract class OpenboxState extends Equatable {
  final List<BoxItem> boxes;
  const OpenboxState({this.boxes,});

  @override
  List<Object> get props => [boxes];
}


class OpenboxInitial extends OpenboxState {
  const OpenboxInitial({List<BoxItem> boxes})
      : super(boxes: boxes);
}

class OpenboxExpanded extends OpenboxState {
  const OpenboxExpanded({List<BoxItem> boxes})
      : super(boxes: boxes,);
}

class OpenboxClosed extends OpenboxState {
  const OpenboxClosed({List<BoxItem> boxes})
      : super(boxes: boxes);
}

class OtherBoxesClosed extends OpenboxState {
  final int index;
  final int closedIndex;
  const OtherBoxesClosed({List<BoxItem> boxes, this.index, this.closedIndex})
      : super(boxes: boxes,);
}