enum WorkoutCategory { yoga, gym, cardio }

class WorkoutActivity {
  final String name;
  final int duration;
  final WorkoutCategory category;

  WorkoutActivity({
    required this.name,
    required this.duration,
    required this.category,
  });
}
