import 'package:car_go_pfe_lp_j2ee_web_panel/widgets/header_item.dart';
import 'package:flutter/material.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({super.key});

  static const String routeName = '/users';

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
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
                  'Manage Passengers',
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        color: Theme.of(context).primaryColor,
                      ),
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  HeaderItem(flexValue: 1, headerTitle: 'PASSENGER ID'),
                  HeaderItem(flexValue: 1, headerTitle: 'PICTURE'),
                  HeaderItem(flexValue: 1, headerTitle: 'PASSENGER NAME'),
                  HeaderItem(flexValue: 1, headerTitle: 'EMAIL'),
                  HeaderItem(flexValue: 1, headerTitle: 'PHONE'),
                  HeaderItem(flexValue: 1, headerTitle: 'ACTIONS'),
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
