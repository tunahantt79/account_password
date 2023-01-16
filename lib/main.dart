import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:grock/grock.dart';
import 'package:kullanici_sifre/view/auth/utils.dart';
import 'package:kullanici_sifre/view/navigation_bar/message/service.dart';
import 'view/auth/auth_page.dart';
import 'view/navigation_bar/bottomnavigatorbar.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

void main() async {
  //FirebaseMessaging.onBackgroundMessage(FirebaseNotificationService.backgroundMessage);

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  static const String title = 'Firebase Auth';
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    // FirebaseCrashlytics.instance.crash();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey:

          //Grock.scaffoldMessengerKey,

          Utils.messengerKey,
      navigatorKey: 
      
      //Grock.navigationKey,

      navigatorKey,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.blueGrey,
        body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text('Something went wrong'));
            } else if (snapshot.hasData) {
              return const BottomNavigatorBar();
            } else {
              return const AuthPage();
            }
          },
        ),
      ),
    );
  }
}
