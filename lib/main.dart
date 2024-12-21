import 'package:flutter/material.dart';
import 'package:hackwave/pages/Admin/AdminHome.dart';
// import 'package:hackwave/pages/Welcomepage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Adminhome(),
    );
  }
}
