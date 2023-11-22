import 'package:flutter/material.dart';
import 'package:my_flutter_demo/page/Page2.dart';
import 'package:my_flutter_demo/page/http_demo/delete_demo.dart';
import 'package:my_flutter_demo/page/http_demo/post_demo.dart';
import 'package:my_flutter_demo/page/http_demo/put_demo.dart';
import 'package:my_flutter_demo/page/http_demo/web_socket_demo.dart';
import 'package:my_flutter_demo/page/json_serializable/remote_photo/FetchJsonDemo.dart';
import 'package:my_flutter_demo/router/router.dart';

import 'page/http_demo/get_demo.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(createRoute(const Page2()));
              },
              child: const Text('Link To Page 2'),
            ),
            const SizedBox(height: 20),
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
          ],
        ),
      ),
    );
  }
}
