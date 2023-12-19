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
  // Clave global para acceder al widget Scaffold y mostrar mensajes en la interfaz de usuario
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Hora actual seleccionada
  late DateTime selectedTime;

  @override
  void initState() {
    super.initState();
    // Inicializa la hora actual con la hora actual del sistema
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
            // Widget reutilizable para seleccionar la hora
            TimePicker(
              selectedTime: selectedTime,
              // Función de devolución de llamada cuando se selecciona una nueva hora
              onTimeSelected: (newTime) {
                setState(() {
                  // Actualiza la hora actual seleccionada
                  selectedTime = newTime;
                });
              },
            ),
            const SizedBox(height: 20),
            // Botón elevado para programar una notificación con la hora seleccionada
            ElevatedButton(
              onPressed: () =>
                  NotificationScheduler.scheduleNotification(selectedTime),
              child: const Text('Programar Alarma'),
            ),
          ],
        ),
      ),
    );
  }
}
