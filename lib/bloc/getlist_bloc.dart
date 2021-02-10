import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/boxes_fakeAPI.dart';
import '../models/box_item.dart';

part 'getlist_event.dart';
part 'getlist_state.dart';

class GetlistBloc extends Bloc<GetlistEvent, GetlistState> {
  final BoxesAPI _boxesAPI;

  GetlistBloc(this._boxesAPI) : super(GetlistInitial());

  @override
  Stream<GetlistState> mapEventToState(
    GetlistEvent event,
  ) async* {
    if (event is GetList) {
      try {
      yield(ListLoading());
      final boxes = await _boxesAPI.fetchBoxes();
      yield(ListLoaded(boxes));
    } on NetworkException {
      yield(ListError("Не смогли получить информацию, проверьте подключение к интернету"));
    }
    }
  }
}
