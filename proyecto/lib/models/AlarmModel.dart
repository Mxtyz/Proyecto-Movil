// ignore_for_file: file_names

class AlarmModel {
  String title;
  DateTime dateTime;
  String description;
  bool isRecurring;
  List<int> daysOfWeek; // Lista de días para alarmas recurrentes

  AlarmModel({
    required this.title,
    required this.dateTime,
    required this.description,
    required this.isRecurring,
    this.daysOfWeek = const [], // Inicializado como una lista vacía
  });
}
