import 'package:flutter/material.dart';
import 'package:my_flutter_demo/page/http_demo/delete_demo.dart';
import 'package:my_flutter_demo/page/http_demo/post_demo.dart';
import 'package:my_flutter_demo/page/http_demo/put_demo.dart';
import 'package:my_flutter_demo/page/http_demo/web_socket_demo.dart';
import 'package:my_flutter_demo/page/json_serializable/remote_photo/fetch_json_demo.dart';
import 'package:my_flutter_demo/page/patterns_codelab/document_screen_demo.dart';
import 'package:my_flutter_demo/page/persist/local_storage_demo.dart';
import 'package:my_flutter_demo/page/persist/shared_preferences_demo.dart';
import 'package:my_flutter_demo/router/router.dart';

import 'page/http_demo/get_demo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child:ListView(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(const HttpGetDemo()));
              },
              child: const Text('Link To HttpGet Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(const HttpPostDemo()));
              },
              child: const Text('Link To HttpPost Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(const HttpPutDemo()));
              },
              child: const Text('Link To HttpPut Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(const HttpDeleteDemo()));
              },
              child: const Text('Link To HttpDelete Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(const WebSocketDemo()));
              },
              child: const Text('Link To WebStock Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(const FetchJsonDemo()));
              },
              child: const Text('Link To FetchJsonDemo Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(createRoute(const SharedPreferencesDemo()));
              },
              child: const Text('Link To Shared Preferences Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(CounterStorageDemo()));
              },
              child: const Text('Link To Local Storage Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(DocumentScreenDemo()));
              },
              child: const Text('Link To Document Screen Demo'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/layout');
              },
              child: const Text('Go Layout Demo'),
            ),
          ],
        ),
      ),
    );
  }
}
