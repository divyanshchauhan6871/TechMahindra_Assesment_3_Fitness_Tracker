import 'package:flutter/material.dart';

class BMICalculate extends StatefulWidget {
  const BMICalculate({super.key});

  @override
  State<BMICalculate> createState() => _BMICalculateState();
}

class _BMICalculateState extends State<BMICalculate> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();

  double? _bmi;

  void _calculateBMI() {
    final heightCm = double.tryParse(_heightController.text);
    final weightKg = double.tryParse(_weightController.text);

    if (heightCm == null || weightKg == null || heightCm == 0) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 1),
          content: Text('Please enter valid numbers for height and weight.'),
        ),
      );
      return;
    }

    final heightM = heightCm / 100;
    final bmi = weightKg / (heightM * heightM);

    setState(() {
      _bmi = bmi;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 234, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 5, 19, 30),
        title: const Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Height input
              TextField(
                controller: _heightController,
                decoration: const InputDecoration(
                  labelText: 'Height (cm)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),

              // Weight input
              TextField(
                controller: _weightController,
                decoration: const InputDecoration(
                  labelText: 'Weight (kg)',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),

              // Calculate button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 142, 254, 254),
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  elevation: 8,
                ),
                onPressed: _calculateBMI,
                child: const Text('Calculate BMI'),
              ),
              const SizedBox(height: 30),

              // Result
              if (_bmi != null)
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'Your BMI is:',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _bmi!.toStringAsFixed(2),
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
            ],
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
}
