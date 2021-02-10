part of 'getlist_bloc.dart';

abstract class GetlistEvent extends Equatable {
  const GetlistEvent();

  @override
  List<Object> get props => [];
}

class GetList extends GetlistEvent {
  GetList();
}
