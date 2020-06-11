import 'package:flutter/material.dart';
import 'DashboardPage.dart';
void main()=>runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food App",
      theme: ThemeData(
        primaryColor: Colors.amber,
        fontFamily: 'Bitter',
      ),
      debugShowCheckedModeBanner: false,
      home: DashboardPage(),
    );
  }
}