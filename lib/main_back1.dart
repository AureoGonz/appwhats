import 'package:extra/bienvenido/main.dart';
import 'package:flutter/material.dart';
import 'package:screen/screen.dart';

Future main() async {
  Screen.keepOn(true);
  runApp(new Welcome());
}

class Welcome extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Welcome();
  }
}

class _Welcome extends State {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Bienvenido(),
    );
  }
}
