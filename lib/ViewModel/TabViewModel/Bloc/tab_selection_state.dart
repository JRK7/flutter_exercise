part of 'tab_selection_bloc.dart';

class TabSelectionState extends Equatable {
  final int index;

  const TabSelectionState(this.index);

  TabSelectionState copyWith({int? index}) {
    return TabSelectionState(index ?? this.index);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [index];
}
