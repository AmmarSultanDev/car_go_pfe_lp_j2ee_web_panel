import 'package:car_go_pfe_lp_j2ee_web_panel/widgets/drivers_data_list.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/widgets/header_item.dart';
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
                  HeaderItem(flexValue: 1, headerTitle: 'DRIVER ID'),
                  HeaderItem(flexValue: 1, headerTitle: 'PICTURE'),
                  HeaderItem(flexValue: 1, headerTitle: 'DRIVER NAME'),
                  HeaderItem(flexValue: 1, headerTitle: 'EMAIL'),
                  HeaderItem(flexValue: 1, headerTitle: 'PHONE'),
                  HeaderItem(flexValue: 1, headerTitle: 'CAR DETAILS'),
                  HeaderItem(flexValue: 1, headerTitle: 'TOTAL EARNINGS'),
                  HeaderItem(flexValue: 1, headerTitle: 'ACTIONS'),
                ],
              ),
              // display data
              const DriversDataList(),
            ],
          ),
        ),
      ),
    );
  }
}
