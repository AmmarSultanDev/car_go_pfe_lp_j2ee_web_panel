import 'package:car_go_pfe_lp_j2ee_web_panel/widgets/header.dart';
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
                  'Manage Drivers',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Header(flexValue: 1, headerTitle: 'DRIVER ID'),
                  Header(flexValue: 1, headerTitle: 'PICTURE'),
                  Header(flexValue: 1, headerTitle: 'DRIVER NAME'),
                  Header(flexValue: 1, headerTitle: 'EMAIL'),
                  Header(flexValue: 1, headerTitle: 'PHONE'),
                  Header(flexValue: 1, headerTitle: 'CAR DETAILS'),
                  Header(flexValue: 1, headerTitle: 'TOTAL EARNINGS'),
                  Header(flexValue: 1, headerTitle: 'ACTIONS'),
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
