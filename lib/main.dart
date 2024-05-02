import 'package:flutter/material.dart';
import 'package:uu_hostel_management/Forms/Login.dart';
import 'package:uu_hostel_management/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//import 'dart:ffi';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); // Corrected the constructor

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: home(),
    );
  }
}
