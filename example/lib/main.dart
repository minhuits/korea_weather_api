import 'dart:io';

import 'package:flutter/material.dart';
import 'package:korea_weather_api/korea_weather_api.dart';

import 'home.dart';

void main() {
  HttpOverrides.global = WeatherHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
