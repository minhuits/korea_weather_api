import 'package:flutter/material.dart';

import 'pages/fct_page.dart';
import 'pages/fct_version_page.dart';
import 'pages/super_fct_page.dart';
import 'pages/super_nct_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void push(BuildContext context, Widget widget) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => widget),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => push(context, const FctVersionPage()),
              child: const Text('예보 버전 (Fct Version)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => push(context, const FctPage()),
              child: const Text('단기 예보 (Fct)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => push(context, const SuperFctPage()),
              child: const Text('초단기 예보 (Super Fct)'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => push(context, const SuperNctPage()),
              child: const Text('초단기 실황 (Super Nct)'),
            ),
          ],
        ),
      ),
    );
  }
}
