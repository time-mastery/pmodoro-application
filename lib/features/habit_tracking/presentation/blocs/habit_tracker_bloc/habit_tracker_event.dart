part of "habit_tracker_bloc.dart";

abstract class HabitTrackerEvent extends Equatable {
  const HabitTrackerEvent();

  @override
  List<Object> get props => [];
}

class AllHabitsFetched extends HabitTrackerEvent {}

class HabitDeleted extends HabitTrackerEvent {
  final String uuid;

  const HabitDeleted(this.uuid);
}

class HabitUpdated extends HabitTrackerEvent {
  final HabitEntity updatedHabit;

  const HabitUpdated(this.updatedHabit);
}

class HabitDone extends HabitTrackerEvent {
  final String uuid;

  const HabitDone(this.uuid);
}
