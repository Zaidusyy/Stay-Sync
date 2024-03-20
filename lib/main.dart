import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Forms/Login.dart';
import 'package:uu_hostel_management/home.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: home(),);
  }
}
