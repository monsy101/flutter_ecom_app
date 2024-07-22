import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monsy_flutter_project/assets/colors/colors.dart';
import 'package:monsy_flutter_project/login_screen/login_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: CircleAvatar(
                      radius: 40,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        'Logged in as',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'placeholderUserName',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => LoginScreen()));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    shadowColor: colors[0],
                    backgroundColor: colors[1],
                    minimumSize: const Size(double.infinity, 50)),
                child: Opacity(
                    opacity: 1,
                    child: Text(
                      'Log out',
                      style: TextStyle(color: colors[4], fontSize: 24),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
