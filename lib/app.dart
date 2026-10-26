import 'package:app_project/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'Todo_List/home.dart';
import 'money_management.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Croud app',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue
      ),
      home: HomeScreen(),
    );
  }
}

