// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  final DateTime selectedTime;
  final Function(DateTime) onTimeSelected;

  const TimePicker({
    Key? key,
    required this.selectedTime,
    required this.onTimeSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(selectedTime),
        );

        if (picked != null && picked != TimeOfDay.now()) {
          final newTime = DateTime(
            selectedTime.year,
            selectedTime.month,
            selectedTime.day,
            picked.hour,
            picked.minute,
          );
          onTimeSelected(newTime);
        }
      },
      child: const Text('Seleccionar Hora'),
    );
  }
}
