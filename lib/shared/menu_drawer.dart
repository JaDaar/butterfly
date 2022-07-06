import 'package:butterfly/screens/user_screen.dart';
import 'package:butterfly/screens/weather.dart';
import 'package:flutter/material.dart';
import '../screens/intro_screen.dart';
import '../screens/weight_tracker_screen.dart';
import '../screens/about_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    final List<String> menuTitles = <String>[
      'Home',
      'Weight Tracker',
      'Weather Tracker',
      'Butterfly Users',
      'Settings',
      'About'
    ];

    List<Widget> menuItems = [];
    menuItems.add(const DrawerHeader(
        decoration: BoxDecoration(color: Colors.blueGrey),
        child: Text('Butterfly',
            style: TextStyle(color: Colors.white, fontSize: 28))));
    // ignore: avoid_function_literals_in_foreach_calls
    menuTitles.forEach((String element) {
      Widget screen = Container();
      menuItems.add(ListTile(
        title: Text(element, style: const TextStyle(fontSize: 18)),
        onTap: () {
          switch (element) {
            case 'Home':
              screen = IntroScreen();
              break;
            case 'Weight Tracker':
              screen = WeightTracker();
              break;
            case 'Weather Tracker':
              screen = WeatherScreen();
              break;
            case 'Butterfly Users':
              screen = UserScreen();
              break;
            case 'About':
              screen = About();
              break;
            default:
          }
          Navigator.of(context)
              .pop(); // removes the scaffold from the stack, so when navigating using back button,
          //  it will not go to the previous screen - which is the Drawer

          //  Navigate to selected screen, and close the drawer
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });
    return menuItems;
  }
}
