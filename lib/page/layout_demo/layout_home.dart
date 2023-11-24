import 'package:flutter/material.dart';
import 'package:my_flutter_demo/router/router.dart';

import 'horizons_demo_app.dart';
class LayoutHome extends StatelessWidget {
  const LayoutHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: ListView(
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(createRoute(const HorizonsDemoApp()));
            },
            child: const Text('Link To HorizonsDemoApp Demo'),
          ),
        ],
      )
    ));
  }
}