part of 'getlist_bloc.dart';

abstract class GetlistState extends Equatable {
  const GetlistState();
  
  @override
  List<Object> get props => [];
}

class GetlistInitial extends GetlistState {
  const GetlistInitial();
}

class ListLoading extends GetlistState {
  const ListLoading();
}

class ListLoaded extends GetlistState {
   final List<BoxItem> boxes;
  const ListLoaded(this.boxes);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ListLoaded && o.boxes == boxes;
  }

  @override
  int get hashCode => boxes.hashCode;
}

class ListError extends GetlistState {
  final String message;
  const ListError(this.message);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is ListError && o.message == message;
  }

  @override
  int get hashCode => message.hashCode;
}
