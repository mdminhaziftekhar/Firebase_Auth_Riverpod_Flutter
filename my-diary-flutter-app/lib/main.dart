import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_diary/api/api.dart';
import 'package:my_diary/api/app_provider_observer.dart';
import 'package:my_diary/screens/home/home.dart';
import 'package:my_diary/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart' as provider;

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final ProviderContainer container = ProviderContainer(
    // This observer is used for logging changes in all Riverpod providers.
    observers: <ProviderObserver>[AppProviderObserver()],
  );

  String baseUrl = 'https://skrentapp.fly.dev';

  if (!kIsWeb) {
    if (Platform.isAndroid) {
      baseUrl = 'https://skrentapp.fly.dev';
    }
  }

  final api = Api();
  await api.initialize(apiRestUrl: baseUrl, apiRestPort: '8090', debug: true);
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.white),
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          ),
        ),
        darkTheme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
          appBarTheme: const AppBarTheme(
            color: Colors.white,
          ),
        ),
        home: WelcomeScreen(),
      
    );
  }
}
