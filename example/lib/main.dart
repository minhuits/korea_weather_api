import 'dart:io';

import 'package:flutter/material.dart';
import 'package:korea_weather_api/korea_weather_api.dart';

import 'pages/fct_page.dart';
import 'pages/fct_version_page.dart';
import 'pages/super_fct_page.dart';
import 'pages/super_nct_page.dart';

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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void push(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  @override
  Widget build(BuildContext context) {
    const apiKey = '';

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => push(
                context,
                const SuperNctPage(apiKey: apiKey),
              ),
              child: const Text('초단기 실황 (Super Nct)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => push(
                context,
                const SuperFctPage(apiKey: apiKey),
              ),
              child: const Text('초단기 예보 (Super Fct)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => push(
                context,
                const FctPage(apiKey: apiKey),
              ),
              child: const Text('단기 예보 (Fct)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => push(
                context,
                const FctVersionPage(apiKey: apiKey),
              ),
              child: const Text('예보 버전 (Fct Version)'),
            ),
          ],
        ),
      ),
    );
  }
}
