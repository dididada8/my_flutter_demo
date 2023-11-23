import 'package:flutter/material.dart';
import 'package:my_flutter_demo/page/layout_demo/layout_home.dart';

import 'home.dart';

void main() {
  runApp(
    MaterialApp(
        initialRoute: '/',
        routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const Home(),
          '/layout': (context) => const LayoutHome(),
    }),
  );
}
