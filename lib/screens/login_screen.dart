import 'dart:io' show Platform, exit;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:login_signup/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String email, password) async {
    try {
      Response response =
          await post(Uri.parse('https://reqres.in/api/login'), body: {
        'email': email,
        'password': password,
      });
      if (response.statusCode == 200) {
        debugPrint(response.body.toString());
        debugPrint('Login Successfully');
      } else {
        debugPrint('Failed to initialize');
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<bool?> showWarningContext(BuildContext context) async => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            "Do you want to exit app?",
            style: TextStyle(color: Color(0xff074974)),
          ),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(
                  "No",
                  style: TextStyle(color: Color(0xff074974)),
                )),
            TextButton(
                onPressed: () {
                  if (Platform.isAndroid) {
                    SystemNavigator.pop();
                  } else if (Platform.isIOS) {
                    exit(0);
                  }
                },
                child: Text("Yes", style: TextStyle(color: Color(0xff074974)))),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: WillPopScope(
        onWillPop: () async {
          final shouldPop = await showWarningContext(context);
          return shouldPop ?? false;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text("Signup-Api")),
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Email',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Password',
                  ),
                  controller: passwordController,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  width: 400,
                  decoration: BoxDecoration(
                    color: Colors.greenAccent,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: TextButton(
                    onPressed: () {
                      debugPrint(emailController.text.toString());
                      debugPrint(passwordController.text.toString());
                      login(emailController.text.toString(),
                          passwordController.text.toString());
                    },
                    child: Text('Login'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  },
                  child: Text(
                    "Signup Here",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
