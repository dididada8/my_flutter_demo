import 'package:flutter/material.dart';
import 'package:my_flutter_demo/router/router.dart';

import 'navigation/drawer_example.dart';
import 'navigation/navigation_drawer_example.dart';
import 'scroll/horizons_demo_step_by_step_2.dart';
import 'scroll/horizons_demo_step_by_step_1.dart';

class LayoutHome extends StatelessWidget {
  const LayoutHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Center(
            child: ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(createRoute(const HorizonsStepByStepDemo1App()));
              },
              child: const Text('Link To Horizons-Step-By-Step 1 Demo'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(createRoute(const HorizonsStepByStepDemo2App()));
              },
              child: const Text('Link To Horizons-Step-By-Step 2 Demo'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const DrawerExampleDemo()),
                );
              },
              child: const Text('Link To Drawer Demo'),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NavigationDrawerDemo()),
                );
              },
              child: const Text('Link To Navigation Drawer Demo'),
            )
          ],
        )));
  }
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pushNamed(context, '/layout');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }
}
