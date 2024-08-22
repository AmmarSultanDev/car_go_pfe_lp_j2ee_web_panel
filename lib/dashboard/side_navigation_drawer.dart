import 'package:car_go_pfe_lp_j2ee_web_panel/pages/drivers_page.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/pages/home_page.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/pages/trips_page.dart';
import 'package:car_go_pfe_lp_j2ee_web_panel/pages/users_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_admin_scaffold/admin_scaffold.dart';
import 'package:flutter_svg/svg.dart';

class SideNavigationDrawer extends StatefulWidget {
  const SideNavigationDrawer({super.key});

  static const String routeName = '/';

  @override
  State<SideNavigationDrawer> createState() => _SideNavigationDrawerState();
}

class _SideNavigationDrawerState extends State<SideNavigationDrawer> {
  Widget choosenPage = const HomePage();
  String selectedRoute = '';

  sendAdminTo(selectedPage) {
    // Send the admin to the selected route
    switch (selectedPage.route) {
      case DriversPage.routeName:
        setState(() {
          choosenPage = const DriversPage();
          selectedRoute = DriversPage.routeName;
        });
        break;
      case UsersPage.routeName:
        setState(() {
          choosenPage = const UsersPage();
          selectedRoute = UsersPage.routeName;
        });
        break;
      case TripsPage.routeName:
        setState(() {
          choosenPage = const TripsPage();
          selectedRoute = TripsPage.routeName;
        });
        break;
      default:
        setState(() {
          choosenPage = const HomePage();
          selectedRoute = SideNavigationDrawer.routeName;
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AdminScaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Admin Web Panel'),
      ),
      sideBar: SideBar(
        items: const [
          AdminMenuItem(
              title: 'Drivers',
              route: DriversPage.routeName,
              icon: CupertinoIcons.car_detailed),
          AdminMenuItem(
              title: 'Users',
              route: UsersPage.routeName,
              icon: CupertinoIcons.person_2_fill),
          AdminMenuItem(
              title: 'Trips',
              route: TripsPage.routeName,
              icon: CupertinoIcons.location_fill),
        ],
        selectedRoute: selectedRoute,
        onSelected: (itemSelected) {
          sendAdminTo(itemSelected);
        },
        header: Container(
          padding: const EdgeInsets.all(20),
          color: Theme.of(context).secondaryHeaderColor,
          height: 240,
          width: 240,
          child: Image.asset('assets/images/side_navigation_header.png'),
        ),
        footer: Container(
          padding: const EdgeInsets.all(20),
          color: Theme.of(context).secondaryHeaderColor,
          height: 240,
          width: 240,
          child: SvgPicture.asset('assets/images/logo-cigma-scroll.svg'),
        ),
      ),
      body: choosenPage,
    );
  }
}
