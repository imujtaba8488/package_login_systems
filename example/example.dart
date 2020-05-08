import 'package:flutter/material.dart';
import 'package:login_systems/login_systems.dart';

main() => MyApp();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GreyLoginSystem(),
      ),
    );
  }
}
