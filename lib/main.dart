import 'package:car_go_pfe_lp_j2ee_web_panel/dashboard/side_navigation_drawer.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/pages/drivers_page.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/pages/home_page.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/pages/trips_page.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/pages/users_page.dart';
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
