import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static initMessaging() async {
    String token = await firebaseMessaging.getToken() ?? "-";
    print(token);

    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onBackgroundMessage(_onBackGroundMessage);
  }

  //SUSCRIBIR A UN TOPIC
  Future<void> suscribeToTopic(String topic) async {
    await firebaseMessaging.subscribeToTopic(topic);
    print("Dispositivo suscrito a el topic: $topic");
  }

  // CANCELAR SUSCRIPCIÓN
  Future<void> unsuscrbineSuscription(String topic) async {
    await firebaseMessaging.unsubscribeFromTopic(topic);
    print("Dispositivo eliminado del topic: $topic");
  }

  // Cuando el app esta abierta
  static _onMessage(RemoteMessage message) {
    if (message.notification != null) {
      print("****************************");
      print(message.notification);
      print(message.notification!.title);
      print(message.notification!.body);
      print("****************************");
    }

    if (message.data.isNotEmpty) {
      print("*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*");
      print("DATOS: ${message.data}");
      print("EXTRA_DATA: ${message.data["extra_data"]}");
      print("CÓDIGO PROMOCIONAL: ${message.data["prom_code"]}");
      print("*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*/*");
    }
  }

  static Future<void> _onBackGroundMessage(RemoteMessage message) async {
    print("aaaa");
    if (message.notification != null) {
      print("------------------------------");
      print(message.notification);
      print(message.notification!.title);
      print(message.notification!.body);
      print("------------------------------");
    }
  }
}
