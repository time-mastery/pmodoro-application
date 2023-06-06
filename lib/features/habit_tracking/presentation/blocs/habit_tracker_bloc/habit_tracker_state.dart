part of "habit_tracker_bloc.dart";

abstract class HabitTrackerState extends Equatable {
  const HabitTrackerState();

  @override
  List<Object> get props => [];
}

class HabitTrackerInitial extends HabitTrackerState {}

class FetchHabits extends HabitTrackerState {
  final List<HabitEntity> habits;
  final bool loading, error;

  const FetchHabits({
    required this.habits,
    required this.loading,
    required this.error,
  });

  @override
  List<Object> get props => [
        habits,
        loading,
        error,
      ];
}

class DeleteHabit extends HabitTrackerState {
  final bool loading, error;
  final List<HabitEntity> habits;

  const DeleteHabit({
    required this.loading,
    required this.error,
    required this.habits,
  });

  @override
  List<Object> get props => [loading, error, habits];
}

class EditHabit extends HabitTrackerState {
  final bool loading, error;
  final List<HabitEntity> habits;

  const EditHabit({
    required this.loading,
    required this.error,
    required this.habits,
  });

  @override
  List<Object> get props => [
        loading,
        habits,
        error,
      ];
}

class AddHabit extends HabitTrackerState {
  final bool loading, error;

  const AddHabit({
    required this.loading,
    required this.error,
  });

  @override
  List<Object> get props => [
        loading,
        error,
      ];
}

class DoneHabit extends HabitTrackerState {
  final bool loading, error;
  final List<HabitEntity> habits;

  const DoneHabit(this.loading, this.error, this.habits);

  @override
  List<Object> get props => [
        loading,
        error,
        habits,
      ];
}
