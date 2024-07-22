import 'package:flutter/material.dart';
import 'package:monsy_flutter_project/homeScreen/homeScreen.dart';
import 'package:monsy_flutter_project/login_screen/login_screen.dart';
import 'package:monsy_flutter_project/shopping_screen/shopping_screen.dart';
import 'package:monsy_flutter_project/test.dart';

import 'home_app/homeApp.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}
