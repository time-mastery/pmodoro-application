import "package:bloc/bloc.dart";
import "package:equatable/equatable.dart";
import "package:pomodore/features/habit_tracking/domain/entities/habit_entity.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/add_new_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/delete_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/done_today_habit_usecase.dart";
import "package:pomodore/features/habit_tracking/domain/usecases/edit_habit_usecase.dart";
import "package:pomodore/features/task_management/domain/usecases/get_all_categories_usecase.dart";

part "habit_tracker_event.dart";
part "habit_tracker_state.dart";

class HabitTrackerBloc extends Bloc<HabitTrackerEvent, HabitTrackerState> {
  final AddNewHabitUseCase addNewHabitUseCase;
  final DeleteHabitUseCase deleteHabitUseCase;
  final DoneTodayHabitUseCase doneTodayHabitUseCase;
  final EditHabitUseCase editHabitUseCase;
  final GetAllCategoriesUseCase getAllCategoriesUseCase;

  HabitTrackerBloc({
    required this.addNewHabitUseCase,
    required this.deleteHabitUseCase,
    required this.doneTodayHabitUseCase,
    required this.editHabitUseCase,
    required this.getAllCategoriesUseCase,
  }) : super(HabitTrackerInitial()) {
    on<HabitTrackerEvent>((event, emit) {});
    on<AllHabitsFetched>((event, emit) {});
    on<HabitDeleted>((event, emit) {});
    on<HabitUpdated>((event, emit) {});
    on<HabitDone>((event, emit) {});
  }
}
