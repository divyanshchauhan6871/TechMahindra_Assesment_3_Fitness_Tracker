import 'package:fitness_tracker/activity.dart';
import 'package:flutter/material.dart';

class WorkoutProvider with ChangeNotifier {
  final List<WorkoutActivity> _activities = [];

  List<WorkoutActivity> get activities => _activities;

  void addActivity(String name, int duration, WorkoutCategory category) {
    _activities.add(
      WorkoutActivity(name: name, duration: duration, category: category),
    );
    notifyListeners();
  }

  void removeActivity(int index) {
    _activities.removeAt(index);
    notifyListeners();
  }
}
