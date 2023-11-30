// ignore_for_file: file_names

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_app/App/myApp.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

  
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const MyApp()));
    });
    return MaterialApp(home: Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(),
            const Column(
              children: [
                Text("Flutter App", style: TextStyle(color: Colors.white, fontSize: 30),)
              ],
            ),
            const Text("Flutter", style: TextStyle(color: Colors.white),)
          ],
        ),
      ),
    ));
     
  }
}