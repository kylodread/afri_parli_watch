import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Add this import for SystemChrome
import 'screens/splash_screen.dart';
import 'services/notification_service.dart';
import 'package:flutter/rendering.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Set status bar color and style
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.white, // Pure white background
    statusBarIconBrightness: Brightness.dark, // Dark icons for Android
    statusBarBrightness: Brightness.light, // Dark icons for iOS
  ));

  // Initialize notifications
  await NotificationService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AfriParliWatch',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFF022147), // Company blue
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF022147),
          primary: const Color(0xFF022147),
          secondary: const Color(0xFFDEB668), // Gold accent
        ),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
