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

  const HabitUpdated(this.updatedHabit);
}

class HabitDone extends HabitTrackerEvent {
  final String id;

  const HabitDone(this.id);
}

class HabitAdded extends HabitTrackerEvent {
  final HabitParams params;

  const HabitAdded(this.params);
}
