import 'package:car_go_pfe_lp_j2ee_web_panel/dashboard/side_navigation_drawer.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/pages/drivers_page.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/pages/home_page.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/pages/trips_page.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/pages/users_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'web_app_theme.dart'; // Import the theme file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCIsG4boMatPHruLlfr8VqLKIQJhsTXnxs",
      appId: "1:321538158709:web:bdfd749b0d67639d13083c",
      messagingSenderId: "321538158709",
      projectId: "car-go-pfe-lp-j2ee",
      authDomain: "car-go-pfe-lp-j2ee.firebaseapp.com",
      storageBucket: "car-go-pfe-lp-j2ee.appspot.com",
    ),
  );
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

      initialRoute: '/',
      routes: {
        '/': (context) => const SideNavigationDrawer(),
        '/drivers': (context) => const DriversPage(),
        '/users': (context) => const UsersPage(),
        '/trips': (context) => const TripsPage(),
      },
    );
  }
}
