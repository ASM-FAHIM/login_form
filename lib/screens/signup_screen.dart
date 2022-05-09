import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
