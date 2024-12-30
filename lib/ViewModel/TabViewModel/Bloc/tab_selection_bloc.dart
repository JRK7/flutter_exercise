import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'tab_selection_event.dart';
part 'tab_selection_state.dart';

class TabSelectionBloc extends Bloc<TabSelectionEvent, TabSelectionState> {
  TabSelectionBloc() : super(const TabSelectionState(0)) {
    on<TabSelectionEvent>((event, emit) {
      emit(state.copyWith(index: event.index));
    });
  }
}
