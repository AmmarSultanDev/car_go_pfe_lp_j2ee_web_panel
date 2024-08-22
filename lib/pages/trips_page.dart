import 'package:car_go_pfe_lp_j2ee_web_panel/widgets/header.dart';
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Text(
                  'Manage Trips',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Header(flexValue: 1, headerTitle: 'TRIP ID'),
                  Header(flexValue: 1, headerTitle: 'DRIVER ID'),
                  Header(flexValue: 1, headerTitle: 'DRIVER NAME'),
                  Header(flexValue: 1, headerTitle: 'PASSENGER ID'),
                  Header(flexValue: 1, headerTitle: 'PASSENGER NAME'),
                  Header(flexValue: 1, headerTitle: 'DRIVER PHONE'),
                  Header(flexValue: 1, headerTitle: 'CAR DETAILS'),
                  Header(flexValue: 1, headerTitle: 'TRIP PRICE'),
                  Header(flexValue: 1, headerTitle: 'TRIP DATE'),
                  Header(flexValue: 1, headerTitle: 'TRIP DURATION'),
                ],
              ),
              // display data
            ],
          ),
        ),
      ),
    );
  }
}
