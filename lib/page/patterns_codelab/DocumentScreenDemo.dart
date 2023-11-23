import 'package:flutter/material.dart';
import 'data.dart';

class DocumentScreenDemo extends StatelessWidget {
  DocumentScreenDemo({Key? key}) : super(key: key);
  final Document document = Document();

  @override
  Widget build(BuildContext context) {
    var (title, :modified) = document.getMetadata();

    var (title2, :modified2) = document.getMetadata2();

    var (title3, :modified3) = document.getMetadata3();

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Last modified $modified'),
              const SizedBox(height: 20),
              Text('Last modified $modified2'),
              const SizedBox(height: 20),
              Text('Last modified $modified3'),
      ])),
    );
  }
}
