import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/boxes_fakeAPI.dart';
import '../models/box_item.dart';

part 'getlist_state.dart';

class GetlistCubit extends Cubit<GetlistState> {
  final BoxesAPI _boxesAPI;
  GetlistCubit(this._boxesAPI) : super(GetlistInitial());

   Future<void> getBoxes() async {
    try {
      emit(ListLoading());
      final boxes = await _boxesAPI.fetchBoxes();
      emit(ListLoaded(boxes));
    } on NetworkException {
      emit(ListError("Не смогли получить информацию, проверьте подключение к интернету"));
    }
  }
}
