import 'package:flutter/material.dart';
import 'web_app_theme.dart'; // Import the theme file

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: WebAppTheme.lightTheme, // Apply the light theme
      darkTheme: WebAppTheme.darkTheme, // Apply the dark theme
      themeMode: ThemeMode
          .system, // Automatically switch between light and dark themes based on system settings
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Carpooling App'),
        ),
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
