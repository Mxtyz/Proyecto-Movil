import 'package:flutter/material.dart';
import 'package:proyecto/data/NotificationScheduler.dart';
import 'pages/AlarmApp.dart';

void main() async {
  await NotificationScheduler.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarma App',
      theme: ThemeData(
        primaryColor: Colors.blue,
        hintColor: Colors.teal,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.teal,
          ),
        ),
      ),
      home: const AlarmApp(),
    );
  }
}
