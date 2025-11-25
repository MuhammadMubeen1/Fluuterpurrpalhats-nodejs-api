// ignore_for_file: unused_local_variable, prefer_const_constructors, unused_import, depend_on_referenced_packages, unused_element
import 'dart:async';
import 'dart:convert';
import 'dart:io';
// import 'package:awesome_notifications/awesome_notifications.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:purpleheatsdev/services/app_route.dart';
import 'controller/notification/notification_controller.dart';
import 'module/splash.dart';
@pragma('vm:entry-point')
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message)async {
//   await Firebase.initializeApp();
// }
// final notificationCo = Get.put(NotificationController());

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  final Locale? deviceLocale = Get.deviceLocale;
  await GetStorage.init();

  String initialRoute = AppPages.INITIAL;
  runApp(

    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: initialRoute,
      fallbackLocale: Locale('en', 'US'),
      locale: deviceLocale,
      // home:
      home: SplashScreen(),
      getPages: AppPages.routes,
      theme: ThemeData(fontFamily: "Muli"),
      themeMode: ThemeMode.system,
    ),
  );
}

