import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Alarma App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime selectedTime;

  @override
  void initState() {
    super.initState();
    selectedTime = DateTime.now();
  }

  Future<void> _scheduleNotification() async {
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay picked = (await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedTime),
    ))!;

    setState(() {
      selectedTime = DateTime(
        selectedTime.year,
        selectedTime.month,
        selectedTime.day,
        picked.hour,
        picked.minute,
      );
    });
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
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: const Text('Seleccionar Hora'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _scheduleNotification(),
              child: const Text('Programar Alarma'),
            ),
          ],
        ),
      ),
    );
  }
}
