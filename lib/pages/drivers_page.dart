import 'package:flutter/material.dart';

class DriversPage extends StatefulWidget {
  const DriversPage({super.key});

  static const String routeName = '/drivers';

  @override
  State<DriversPage> createState() => _DriversPageState();
}

class _DriversPageState extends State<DriversPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Drivers Page'),
    );
  }
}
