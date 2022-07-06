import 'package:flutter/material.dart';
import 'package:butterfly/shared/menu_drawer.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About Butterfly'),
          backgroundColor: Colors.blueGrey,
        ),
        drawer: const MenuDrawer(),
        body: Container(
          child: const Text('Butterfly Version 1.0',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
        ));
  }
}
