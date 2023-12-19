// ignore_for_file: library_private_types_in_public_api, unused_element

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:proyectomovil/main.dart';

class _MyHomePageState extends State<MyHomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late DateTime selectedTime;
  late DateTime selectedMedicationDateTime; // Nueva variable para almacenar la fecha y hora del medicamento

  @override
  void initState() {
    super.initState();
    selectedTime = DateTime.now();
    selectedMedicationDateTime = DateTime.now(); // Inicializar con la fecha y hora actual
  }

  Future<void> _scheduleNotification() async {
    // Implementa la lógica para programar notificaciones aquí
    // Aquí es donde agregarás el código para manejar las notificaciones
    // Por ahora, imprime la hora programada
    if (kDebugMode) {
      print('Scheduled time: $selectedTime');
    }
    // También imprime la fecha y hora del medicamento
    if (kDebugMode) {
      print('Medication scheduled for: $selectedMedicationDateTime');
    }
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

  // Nueva función para mostrar un cuadro de diálogo y obtener la fecha y hora del medicamento
  Future<void> _addMedication(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (picked != null) {
      // ignore: use_build_context_synchronously
      final TimeOfDay? timePicked = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (timePicked != null) {
        setState(() {
          selectedMedicationDateTime = DateTime(
            picked.year,
            picked.month,
            picked.day,
            timePicked.hour,
            timePicked.minute,
          );
        });
      }
    }
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
              onPressed: () => _addMedication(context),
              child: const Text('Agregar Medicamento'),
            ),
            const SizedBox(height: 20),
            // Muestra la fecha y hora seleccionada para el medicamento
            Text('Medication DateTime: ${selectedMedicationDateTime.toString()}'),
          ],
        ),
      ),
    );
  }
}
