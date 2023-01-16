import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<TodayTasksFetched>(_onFetchTodayTasks);
    on<DailyInformationFetched>(_onFetchDailyInformation);
    on<TaskTimerStarted>(_onStartTimerTask);
  }

  _onFetchTodayTasks(TodayTasksFetched event, Emitter emit) {}

  _onFetchDailyInformation(DailyInformationFetched event, Emitter emit) {}

  _onStartTimerTask(TaskTimerStarted event, Emitter emit) {}
}
