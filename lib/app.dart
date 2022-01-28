import 'package:arcore_flutter_plugin_example/ARViewScreen.dart';
import 'package:arcore_flutter_plugin_example/itemlist.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //where to go
      home: Scaffold(
        appBar: AppBar(
          title: Text("AR Furniture App",),
          centerTitle: true,

        ),
        body: ItemScreen(),
      ),
    );
  }
}
