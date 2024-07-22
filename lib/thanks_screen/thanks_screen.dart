import 'package:flutter/material.dart';

import '../assets/colors/colors.dart';

class ThanksScreen extends StatelessWidget {
  const ThanksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Thanks For Your Purchase',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25,color: colors[1]),
        ),
      ),
    );
  }
}
