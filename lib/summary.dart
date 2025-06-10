import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fitness_tracker/list.dart';
import 'package:fitness_tracker/activity.dart';

class Summary extends StatelessWidget {
  const Summary({super.key});

  @override
  Widget build(BuildContext context) {
    final activities = Provider.of<WorkoutProvider>(context).activities;

    int totalTime = 0;
    for (var activity in activities) {
      totalTime += activity.duration;
    }

    final uniqueCategories =
        activities.map((activity) => activity.category).toSet().toList();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 19, 30),
        title: const Text(
          'Fitness tracker',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          elevation: 8,
          margin: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Your Workout Summary',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 19, 30),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Total Workout Time: $totalTime minutes',
                  style: const TextStyle(fontSize: 18),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Categories Completed:',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                if (uniqueCategories.isEmpty)
                  const Text(
                    'No activities done yet!',
                    style: TextStyle(color: Colors.grey),
                  )
                else
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 8,
                    children:
                        uniqueCategories.map((category) {
                          return Chip(
                            label: Text(category.name.toUpperCase()),
                            backgroundColor: _getCategoryColor(category),
                            labelStyle: const TextStyle(color: Colors.white),
                          );
                        }).toList(),
                  ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: const Color.fromARGB(255, 5, 19, 30),
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 8,
                backgroundColor: const Color.fromARGB(255, 142, 254, 254),
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                shadowColor: Colors.blue,
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/home');
              },
              child: const Text("Home"),
            ),
          ],
        ),
      ),
    );
  }

  static Color _getCategoryColor(WorkoutCategory category) {
    switch (category) {
      case WorkoutCategory.yoga:
        return Colors.green;
      case WorkoutCategory.gym:
        return Colors.blue;
      case WorkoutCategory.cardio:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }
}
