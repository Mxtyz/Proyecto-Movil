// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import '../widgets/TimePicker.dart';
import '../data/NotificationScheduler.dart';

class AlarmApp extends StatefulWidget {
  const AlarmApp({Key? key}) : super(key: key);

  @override
  _AlarmAppState createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text('Alarma App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TimePicker(
              selectedTime: selectedTime,
              onTimeSelected: (newTime) {
                setState(() {
                  selectedTime = newTime;
                });
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => NotificationScheduler.scheduleNotification(selectedTime),
              child: const Text('Programar Alarma'),
            ),
          ],
        ),
      ),
    );
  }
}
