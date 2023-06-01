class HabitParams {
  final String title, description, icon;
  final String? id;
  final int color;

  const HabitParams({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    this.id,
  });
}
