import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'base_event.dart';

part 'base_state.dart';

class BaseBloc extends Bloc<BaseEvent, BaseState> {
  BaseBloc() : super(const PageChangeSuccess(3)) {
    on<BaseEvent>(_baseEvent);
    on<PageIndexChanged>(_pageIndexChanged);
  }

  _baseEvent(BaseEvent event, Emitter<BaseState> emit) {}

  _pageIndexChanged(PageIndexChanged event, Emitter<BaseState> emit) {
    emit(PageChangeSuccess(event.index));
  }
}
