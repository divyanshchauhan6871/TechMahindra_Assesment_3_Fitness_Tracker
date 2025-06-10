import 'package:fitness_tracker/activity.dart';
import 'package:fitness_tracker/list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _nameController = TextEditingController();
  final _durationController = TextEditingController();
  WorkoutCategory? _selectedCategory; // New field

  void _showAddActivityDialog() {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: const Text('Add Workout Activity'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: 'Activity Name'),
                ),
                TextField(
                  controller: _durationController,
                  decoration: const InputDecoration(
                    labelText: 'Duration (minutes)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<WorkoutCategory>(
                  decoration: const InputDecoration(labelText: 'Category'),
                  value: _selectedCategory,
                  items:
                      WorkoutCategory.values.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Text(category.name.toUpperCase()),
                        );
                      }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedCategory = value;
                    });
                  },
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                  _nameController.clear();
                  _durationController.clear();
                  setState(() {
                    _selectedCategory = null;
                  });
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  final name = _nameController.text.trim();
                  final duration = int.tryParse(
                    _durationController.text.trim(),
                  );
                  if (name.isNotEmpty &&
                      duration != null &&
                      _selectedCategory != null) {
                    Provider.of<WorkoutProvider>(
                      context,
                      listen: false,
                    ).addActivity(name, duration, _selectedCategory!);
                    Navigator.of(ctx).pop();
                    _nameController.clear();
                    _durationController.clear();
                    setState(() {
                      _selectedCategory = null;
                    });
                  }
                },
                child: const Text('Add'),
              ),
            ],
          ),
    );
  }

  Icon _getCategoryIcon(WorkoutCategory category) {
    switch (category) {
      case WorkoutCategory.yoga:
        return Icon(Icons.self_improvement, color: Colors.green);
      case WorkoutCategory.gym:
        return Icon(Icons.fitness_center, color: Colors.blue);
      case WorkoutCategory.cardio:
        return Icon(Icons.directions_run, color: Colors.red);
      default:
        return Icon(Icons.help_outline);
    }
  }

  @override
  Widget build(BuildContext context) {
    final workoutProvider = Provider.of<WorkoutProvider>(context);

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 19, 30),
        title: const Text(
          "Fitness Tracker",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, '/summary');
            },
            child: Icon(Icons.access_time, size: 36),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child:
            workoutProvider.activities.isEmpty
                ? const Center(
                  child: Text(
                    'No activities added yet!',
                    style: TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                )
                : ListView.builder(
                  itemCount: workoutProvider.activities.length,
                  itemBuilder: (context, index) {
                    final activity = workoutProvider.activities[index];
                    return Card(
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: _getCategoryIcon(activity.category),
                        title: Text(
                          activity.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        subtitle: Text('${activity.duration} minutes'),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () {
                            workoutProvider.removeActivity(index);
                          },
                        ),
                      ),
                    );
                  },
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
                Navigator.pushNamed(context, '/bmicalc');
              },
              child: const Text("BMI Calculator"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 8,
                backgroundColor: const Color.fromARGB(255, 142, 254, 254),
                foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                shadowColor: Colors.blue,
              ),
              onPressed: _showAddActivityDialog,
              child: const Text("Add Workout Activity"),
            ),
          ],
        ),
      ),
    );
  }
}
