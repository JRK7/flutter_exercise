part of 'tab_selection_bloc.dart';

class TabSelectionEvent extends Equatable {
  final int index;

  const TabSelectionEvent(this.index);

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
