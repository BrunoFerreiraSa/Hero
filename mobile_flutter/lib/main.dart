import 'package:flutter/material.dart';
import 'package:mobile_flutter/pages/Incidents/incidents.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Be The Hero',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Incidents(),
    );
  }
}
