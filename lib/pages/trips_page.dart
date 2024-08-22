import 'package:flutter/material.dart';

class TripsPage extends StatefulWidget {
  const TripsPage({super.key});

  static const String routeName = '/trips';

  @override
  State<TripsPage> createState() => _TripsPageState();
}

class _TripsPageState extends State<TripsPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Trips Page'),
    );
  }
}
