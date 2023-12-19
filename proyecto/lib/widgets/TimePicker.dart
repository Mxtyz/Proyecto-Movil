// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  // La hora actual seleccionada
  final DateTime selectedTime;

  // Función que se llama cuando se selecciona una nueva hora
  final Function(DateTime) onTimeSelected;

  // Constructor que requiere la hora actual y la función de selección de hora
  const TimePicker({
    Key? key,
    required this.selectedTime,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        // Muestra el selector de tiempo y espera a que el usuario seleccione una hora
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(selectedTime),
        );

        // Verifica si se seleccionó una hora y no es la hora actual
        if (picked != null && picked != TimeOfDay.now()) {
          // Crea un nuevo objeto DateTime con la nueva hora seleccionada
          final newTime = DateTime(
            selectedTime.year,
            selectedTime.month,
            selectedTime.day,
            picked.hour,
            picked.minute,
          );

          // Llama a la función de devolución de llamada con la nueva hora seleccionada
          onTimeSelected(newTime);
        }
      },
      child: const Text('Seleccionar Hora'),
    );
  }
}
