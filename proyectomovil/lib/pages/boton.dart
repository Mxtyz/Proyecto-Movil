// ignore_for_file: library_private_types_in_public_api

import 'dart:async';

import 'package:flutter/material.dart';

void main() {
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
        scaffoldBackgroundColor: Colors.grey[200],
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white, backgroundColor: Colors.indigo,
            minimumSize: const Size(200, 50),
          ),
        ),
      ),
      home: const Boton(),
    );
  }
}

class Boton extends StatefulWidget {
  const Boton({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Boton> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime selectedTime;

  // Historial de alarmas
  List<String> alarmHistory = [];

  @override
  void initState() {
    super.initState();
    selectedTime = DateTime.now();
  }

  Future<void> _scheduleNotification() async {
    // Implementa la lógica para programar notificaciones
    // Por ahora, agreguemos la hora programada al historial
    setState(() {
      alarmHistory.add('Scheduled time: $selectedTime');
    });

    // Muestra un mensaje en la consola
    print('Scheduled time: $selectedTime');
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(selectedTime),
    );

    if (picked != null && picked != TimeOfDay.now()) {
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
  }

  // Función para mostrar el historial de alarmas
  void _showAlarmHistory() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Historial de Alarmas'),
          content: Column(
            children: alarmHistory.map((alarm) => Text(alarm)).toList(),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cerrar'),
            ),
          ],
        );
      },
    );
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
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _showAlarmHistory(),
              child: const Text('Historial'),
            ),
          ],
        ),
      ),
    );
  }
}
