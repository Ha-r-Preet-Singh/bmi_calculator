


import 'dart:async';

import 'package:calculator_bmi/screens/BMI/bmi_calculator.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 2),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BmiCalculator(),)),);
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(child: Column(
        children: [
          Image.asset("assets/images/healthy.webp"),

          Text(
            "BMI",
            style: TextStyle(
                fontSize: 100,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 12,
                    color: Colors.white,
                  ),
                ]),
          ),
          Text(
            "Body Mass Index",
            style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                shadows: [
                  Shadow(
                    blurRadius: 12,
                    color: Colors.white,
                  ),
                ]),
          ),
        ],
      )),
    );
  }
}
