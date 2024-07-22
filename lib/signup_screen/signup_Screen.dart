import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monsy_flutter_project/login_screen/login_screen.dart';
import 'package:monsy_flutter_project/signup_screen/signup_Screen.dart';

import '../assets/colors/colors.dart';
import '../home_app/homeApp.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userData.dispose();
  }

  final userData = TextEditingController();
  final FormKey = GlobalKey<FormState>();
  bool isShowPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[4],
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sign up',
              style: TextStyle(
                color: colors[1],
                fontSize: 40,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                if (value?.isEmpty == true) {
                  return "user Mast Have name";
                }
                return null;
              },
              controller: userData,
              // for user data
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(
                  Icons.person_2_rounded,
                  color: colors[1],
                ),
                hintText: 'User name',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                String emailPattern =
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
                RegExp regex = RegExp(emailPattern);
                bool validEmail = regex.hasMatch(value ?? "");
                if (!validEmail) {
                  return "enter valid Email";
                }
                return null;
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(
                  Icons.mail,
                  color: colors[1],
                ),
                hintText: 'Email',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                if (value?.isEmpty == true) {
                  return "password mast have value";
                }
                if ((value?.length ?? 0) < 4) {
                  return "password mast have value";
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: isShowPassword,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(
                  Icons.password_rounded,
                  color: colors[1],
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  icon: Icon(
                    isShowPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
                hintText: 'Enter your Password',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (String? value) {
                if (value?.isEmpty == true) {
                  return "password mast have value";
                }
                if ((value?.length ?? 0) < 4) {
                  return "password mast have value";
                }
                return null;
              },
              keyboardType: TextInputType.visiblePassword,
              obscureText: isShowPassword,
              decoration: InputDecoration(
                errorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                    ),
                    borderRadius: BorderRadius.circular(15)),
                focusedErrorBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.red,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                focusedBorder:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                prefixIcon: Icon(
                  Icons.password_rounded,
                  color: colors[1],
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isShowPassword = !isShowPassword;
                    });
                  },
                  icon: Icon(
                    isShowPassword ? Icons.visibility_off : Icons.visibility,
                    color: Colors.grey,
                  ),
                ),
                hintText: 'Confirm the Password',
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: Divider(
                color: colors[1],
                thickness: 1.4,
              ),
            ),
            // SizedBox(
            //   height: 20,
            // ),
            TextButton(
                onPressed: () {
                  print(userData.text);
                },
                child: Text(
                  'Forgot Password?',
                  style: TextStyle(color: colors[0]),
                )),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeAppScreen()));
              },
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  backgroundColor: colors[1],
                  minimumSize: const Size(double.infinity, 50)),
              child: Opacity(
                  opacity: 1,
                  child: Text(
                    'Sign up',
                    style: TextStyle(color: colors[4], fontSize: 24),
                  )),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already Registered?"),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LoginScreen()));
                    },
                    child: Opacity(
                      opacity: 1,
                      child: Text(
                        'Login',
                        style: TextStyle(color: colors[1], fontSize: 15),
                      ),
                    ))
              ],
            ),
          ],
        ),
      )),
    );
  }
}
