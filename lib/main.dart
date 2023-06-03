import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/AdminHome.dart';
import 'Pages/Checking.dart';
import 'Pages/FormAdd.dart';
import 'Pages/Login.dart';
import 'Pages/Register.dart';
import 'Pages/UserInfo.dart';
import 'Service/AuthProvider.dart';
import 'Service/UserProvider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) => UserProvider(),
        )
      ],
      child: const MyApp(),
    ),
  );
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
      home: const Register(),
    );
  }
}
