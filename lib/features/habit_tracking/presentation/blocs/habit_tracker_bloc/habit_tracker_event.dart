part of "habit_tracker_bloc.dart";

abstract class HabitTrackerEvent extends Equatable {
  const HabitTrackerEvent();

  @override
  List<Object> get props => [];
}

class AllHabitsFetched extends HabitTrackerEvent {}

class HabitDeleted extends HabitTrackerEvent {
  final List<HabitEntity> habits;
  final int id;

  const HabitDeleted(this.id, this.habits);
}

class HabitUpdated extends HabitTrackerEvent {
  final HabitParams updatedHabit;
  final List<HabitEntity> habits;

  const HabitUpdated(this.updatedHabit, this.habits);
}

class HabitDone extends HabitTrackerEvent {
  final HabitOverviewParams params;
  final List<HabitEntity> habits;

  const HabitDone(this.params, this.habits);
}

class HabitAdded extends HabitTrackerEvent {
  final HabitParams params;

  const HabitAdded(this.params);
}
