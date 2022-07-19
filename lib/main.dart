import 'package:flutter/material.dart';
import 'package:tcc_ufu_my_outfit_front/screens/login.page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        secondaryHeaderColor: Colors.pink
      ),
      home: const LoginPage(),
    );
  }
}