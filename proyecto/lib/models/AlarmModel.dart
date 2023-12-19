// ignore_for_file: file_names

// Modelo de datos para representar una alarma
class AlarmModel {
  // Título de la alarma
  String title;

  // Fecha y hora de la alarma
  DateTime dateTime;

  // Descripción de la alarma
  String description;

  // Indicador booleano que representa si la alarma es recurrente
  bool isRecurring;

  // Lista de días para alarmas recurrentes para lunes, miércoles y viernes)
  List<int> daysOfWeek;

  // Constructor que requiere parámetros obligatorios y proporciona valores predeterminados para otros
  AlarmModel({
    required this.title,
    required this.dateTime,
    required this.description,
    required this.isRecurring,
    this.daysOfWeek = const [], // Inicializado como una lista vacía por defecto
  });
}
