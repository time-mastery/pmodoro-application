import "package:bloc/bloc.dart";
import "package:dartz/dartz.dart";
import "package:equatable/equatable.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/add_new_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/delete_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/done_today_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/edit_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/get_all_habits_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/get_all_categories_usecase.dart";

import "../../../../../core/resources/params/habit_params.dart";

part "habit_tracker_event.dart";
part "habit_tracker_state.dart";

class HabitTrackerBloc extends Bloc<HabitTrackerEvent, HabitTrackerState> {
  final AddNewHabitUseCase addNewHabitUseCase;
  final DeleteHabitUseCase deleteHabitUseCase;
  final DoneTodayHabitUseCase doneTodayHabitUseCase;
  final EditHabitUseCase editHabitUseCase;
  final GetAllHabitUseCase getAllHabitUseCase;

  HabitTrackerBloc({
    required this.addNewHabitUseCase,
    required this.deleteHabitUseCase,
    required this.doneTodayHabitUseCase,
    required this.editHabitUseCase,
    required this.getAllHabitUseCase,
  }) : super(HabitTrackerInitial()) {
    on<HabitTrackerEvent>((event, emit) {});
    on<AllHabitsFetched>((event, emit) async {
      emit(const FetchHabits(habits: [], loading: true, error: false));

      Either result = await getAllHabitUseCase.call();

      result.fold(
        (l) => emit(
          const FetchHabits(
            habits: [],
            loading: false,
            error: true,
          ),
        ),
        (r) => emit(
          FetchHabits(
            habits: r,
            loading: false,
            error: false,
          ),
        ),
      );
    });
    on<HabitAdded>((event, emit) async {
      emit(const AddHabit(loading: true, error: false));

      Either result = await addNewHabitUseCase.call(params: event.params);

      result.fold(
        (l) => emit(
          const AddHabit(
            loading: false,
            error: true,
          ),
        ),
        (r) => const AddHabit(
          loading: false,
          error: false,
        ),
      );
    });
    on<HabitDeleted>((event, emit) {});
    on<HabitUpdated>((event, emit) {});
    on<HabitDone>((event, emit) {});
  }
}
