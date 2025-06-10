import 'package:flutter/material.dart';
import 'style.dart';

class LandingOne extends StatelessWidget {
  const LandingOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://images.pexels.com/photos/1431283/pexels-photo-1431283.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  SizedBox(height: 15),
                  Text(
                    "Fitness Tracker",
                    style: TextStyle(color: Colors.white, fontSize: 32),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/landingtwo');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(
                            0.6,
                          ), // dark, semi-transparent background
                          foregroundColor: Colors.white, // text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ), // white border
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text("Next"),
                      ),
                      SizedBox(width: 15),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black.withOpacity(
                            0.6,
                          ), // dark, semi-transparent background
                          foregroundColor: Colors.white, // text color
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 1,
                            ), // white border
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: Text("Skip"),
                      ),
                    ],
                  ),
                  SizedBox(height: 22),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
