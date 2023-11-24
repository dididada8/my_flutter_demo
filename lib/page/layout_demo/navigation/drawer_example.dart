import 'package:flutter/material.dart';



class DrawerExampleDemo extends StatelessWidget {
  const DrawerExampleDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home:  DrawerExample(outerBuildContext: context),
    );
  }
}

class DrawerExample extends StatefulWidget {
  final BuildContext outerBuildContext;
  const DrawerExample({Key? key, required this.outerBuildContext}) : super(key: key);

  @override
  State<DrawerExample> createState() => _DrawerExampleState(outerBuildContext);
}

class _DrawerExampleState extends State<DrawerExample> {
  var selectedPage = '';
  final BuildContext outerBuildContext ;

  _DrawerExampleState(this.outerBuildContext);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drawer Example'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(outerBuildContext, '/layout');
            },
            icon: const Icon(Icons.arrow_back),
          )
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.message),
              title: const Text('Messages'),
              onTap: () {
                setState(() {
                  selectedPage = 'Messages';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
              onTap: () {
                setState(() {
                  selectedPage = 'Profile';
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                setState(() {
                  selectedPage = 'Settings';
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: Text(
          selectedPage,
          style: const TextStyle(fontSize: 30),
        ),
      ),
    );
  }
}
