import 'package:car_go_pfe_lp_j2ee_web_panel/widgets/header_item.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/widgets/tirps_data_list.dart';
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
                  HeaderItem(flexValue: 1, headerTitle: 'TRIP ID'),
                  HeaderItem(flexValue: 1, headerTitle: 'DRIVER ID'),
                  HeaderItem(flexValue: 1, headerTitle: 'DRIVER NAME'),
                  HeaderItem(flexValue: 1, headerTitle: 'PASSENGER ID'),
                  HeaderItem(flexValue: 1, headerTitle: 'PASSENGER NAME'),
                  HeaderItem(flexValue: 1, headerTitle: 'DRIVER PHONE'),
                  HeaderItem(flexValue: 1, headerTitle: 'CAR DETAILS'),
                  HeaderItem(flexValue: 1, headerTitle: 'TRIP PRICE'),
                  HeaderItem(flexValue: 1, headerTitle: 'TRIP DATE'),
                  HeaderItem(flexValue: 1, headerTitle: 'TRIP DURATION'),
                ],
              ),
              const TirpsDataList(),
              // display data
            ],
          ),
        ),
      ),
    );
  }
}
