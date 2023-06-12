class HabitParams {
  final String title, description, icon, uuid;
  final int? id;
  final int color;

  const HabitParams({
    required this.title,
    required this.uuid,
    required this.description,
    required this.icon,
    required this.color,
    this.id,
  });
}

class HabitOverviewParams {
  final String uuid;
  final bool completedToday;

  HabitOverviewParams(this.uuid, this.completedToday);
}
