import 'package:butterfly/shared/menu_drawer.dart';
import 'package:flutter/material.dart';
import '../shared/menu_drawer.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                backgroundColor: Colors.blueGrey,
                title: const Text(
                  'Butterfly 3',
                )),
            drawer: MenuDrawer(),
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'assets/spoon_3d_structure_circles_surface_111013_3840x2400.jpg'),
                      fit: BoxFit.cover)),
              // child: Center(
              //   child: Container(
              //       padding: const EdgeInsets.all(5.0),
              //       decoration: BoxDecoration(
              //           color: Colors.white60,
              //           borderRadius: BorderRadius.circular(20)),
              //       child: const Text(
              //         '',
              //         style: TextStyle(
              //             fontSize: 30,
              //             fontWeight: FontWeight.bold,
              //             shadows: [
              //               Shadow(
              //                   offset: Offset(2.0, 2.0),
              //                   blurRadius: 3.0,
              //                   color: Colors.purple)
              //             ]),
              //         textAlign: TextAlign.center,
              //      )),
              //)),
            )));
  }
}
