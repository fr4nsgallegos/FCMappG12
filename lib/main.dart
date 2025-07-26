import 'package:fcmappg12/firebase_options.dart';
import 'package:fcmappg12/home_page.dart';
import 'package:fcmappg12/utils/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await NotificationService.initMessaging();
  // await NotificationService().suscribeToTopic("beneficiados");
  await NotificationService().unsuscrbineSuscription("beneficiados");
  runApp(MaterialApp(home: HomePage(), debugShowCheckedModeBanner: false));
}
