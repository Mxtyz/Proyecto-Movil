// Ignore warnings relacionados con el uso de miembros obsoletos y la preferencia de tipos no inicializados
// Estos warnings se ignoran para permitir el uso de ciertos métodos y para permitir tipos de variables no inicializados.

// ignore_for_file: deprecated_member_use

import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationScheduler {
  // Instancia única del plugin de notificaciones locales
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  // Inicializa el plugin de notificaciones locales
  static Future<void> initialize() async {
    // Configuración de inicialización para Android
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    // Inicializa el plugin con las configuraciones de inicialización
    await _notificationsPlugin.initialize(const InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: null, // No se proporcionan configuraciones específicas de iOS en este ejemplo
    ));
  }

  // Programa una notificación en el tiempo seleccionado
  static Future<void> scheduleNotification(DateTime selectedTime) async {
    // Configuración específica de Android para la notificación
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'alarm_notification_channel', // ID del canal de notificación
      'Alarm Notification Channel', // Nombre del canal de notificación
      importance: Importance.max, // Importancia máxima
      priority: Priority.high, // Prioridad alta
      showWhen: false, // No mostrar la hora de la notificación
    );

    // Configuración general de la notificación para todas las plataformas
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);

    // Programa la notificación en una zona horaria específica
    var tz;
    await _notificationsPlugin.zonedSchedule(
      0, // ID único para la notificación
      'Alarma', // Título de la notificación
      '¡Es hora de despertar!', // Cuerpo de la notificación
      tz.TZDateTime.from(selectedTime, tz.local), // Fecha y hora de la notificación
      platformChannelSpecifics,
      androidAllowWhileIdle: true, // Permite que la notificación se ejecute incluso en modo de bajo consumo
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime, // Interpretación absoluta de la fecha y hora
    );
  }
}
