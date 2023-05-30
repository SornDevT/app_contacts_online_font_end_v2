import 'package:flutter/material.dart';

import 'Pages/AdminHome.dart';
import 'Pages/Checking.dart';
import 'Pages/FormAdd.dart';
import 'Pages/Login.dart';
import 'Pages/Register.dart';
import 'Pages/UserInfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FormAdd(),
    );
  }
}
