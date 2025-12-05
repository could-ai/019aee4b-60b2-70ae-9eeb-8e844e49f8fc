import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/admin_setup_screen.dart';
import 'screens/main_nav_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'متجري الإلكتروني',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'), // Arabic
        Locale('en', 'US'), // English
      ],
      locale: const Locale('ar', 'AE'),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFF4747), // AliExpress Red
          primary: const Color(0xFFFF4747),
          secondary: const Color(0xFFFFC107), // Amber/Yellow for deals
        ),
        useMaterial3: true,
        fontFamily: 'Arial',
        scaffoldBackgroundColor: const Color(0xFFF5F5F5), // Light grey background
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AdminSetupScreen(),
        '/home': (context) => const MainNavScreen(),
      },
    );
  }
}
