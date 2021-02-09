import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../models/box_item.dart';

part 'filterboxes_state.dart';

class FilterBoxesCubit extends Cubit<FilterBoxesState> {
  FilterBoxesCubit() : super(FilterBoxesInitial());

  void filterBoxes(String filter, List<BoxItem> filteredboxes) {
    print(filter);
     filteredboxes = filteredboxes
            .where((u) => (u.title
                    .toLowerCase()
                    .contains(filter.toLowerCase())))
            .toList();
    print(filteredboxes[0].title);
    emit(FilteredBoxes(boxes: filteredboxes, filter: filter));
  }
}

