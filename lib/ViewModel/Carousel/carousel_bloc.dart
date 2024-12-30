import 'package:bloc/bloc.dart';

part 'carousel_event.dart';
part 'carousel_state.dart';

class CarouselBloc extends Bloc<CarouselPageChanged, CarouselCustomState> {
  CarouselBloc() : super(const CarouselCustomState(currentIndex: 0)) {
    on<CarouselPageChanged>((event, emit) {
      emit(CarouselCustomState(currentIndex: event.index));
    });
  }
}
