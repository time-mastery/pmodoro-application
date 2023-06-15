import "package:bloc/bloc.dart";
import "package:dartz/dartz.dart";
import "package:equatable/equatable.dart";
import "package:pomodore/core/resources/params/no_params.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/add_new_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/delete_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/done_today_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/edit_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/get_all_habits_usecase.dart";

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
    on<AllHabitsFetched>(_allHabitFetched);
    on<HabitAdded>(_habitAdded);
    on<HabitDeleted>(_habitDeleted);
    on<HabitUpdated>(_habitUpdated);
    on<HabitDone>(_habitDone);
  }

  _habitUpdated(HabitUpdated event, emit) async {
    emit(const EditHabit(loading: true, error: false, habits: []));

    Either result = await editHabitUseCase.call(params: event.updatedHabit);

    result.fold(
      (l) => emit(const EditHabit(loading: false, error: true, habits: [])),
      (r) {
        int index = event.habits
            .indexWhere((element) => element.id == event.updatedHabit.id);
        List<HabitEntity> newList = event.habits;

        newList.removeAt(index);
        newList.insert(index, r);

        emit(EditHabit(loading: false, error: false, habits: event.habits));
      },
    );
  }

  _habitDone(HabitDone event, emit) async {
    emit(const DoneHabit(true, false, []));

    Either<String, HabitEntity> result =
        await doneTodayHabitUseCase.call(params: event.id);

    result.fold(
      (l) => emit(const DoneHabit(false, true, [])),
      (r) {
        List<HabitEntity> newList = [];
        newList = event.habits;
        int index = newList.indexWhere(
          (element) => element.id == event.id,
        );
        newList.removeAt(index);
        newList.insert(index, r);
        return emit(DoneHabit(false, false, newList));
      },
    );
  }

  _allHabitFetched(event, emit) async {
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
  }

  _habitAdded(event, emit) async {
    emit(const AddHabit(loading: true, error: false));

    Either result = await addNewHabitUseCase.call(params: event.params);

    result.fold(
        (l) => emit(
              const AddHabit(
                loading: false,
                error: true,
              ),
            ),
        (r) => emit(
              const AddHabit(
                loading: false,
                error: false,
              ),
            ));
  }

  _habitDeleted(event, emit) async {
    emit(const DeleteHabit(habits: [], loading: true, error: false));

    Either<String, NoParams> result =
        await deleteHabitUseCase.call(params: event.id);

    result.fold(
        (l) => emit(const DeleteHabit(habits: [], loading: false, error: true)),
        (r) {
      List<HabitEntity> newList = event.habits;
      newList.removeWhere((element) => element.id == event.id);
      emit(
        DeleteHabit(
          habits: newList,
          loading: false,
          error: false,
        ),
      );
    });
  }
}
