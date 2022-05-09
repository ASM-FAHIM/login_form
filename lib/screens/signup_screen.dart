import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup/controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  final SignupController _signupController = Get.find();
  SignupScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.greenAccent,
        centerTitle: true,
        title: Text("Signup"),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(
            top: 60,
            left: 20,
            right: 20,
          ),
          width: context.width,
          height: context.height,
          child: SingleChildScrollView(
            child: Form(
              // key: ,
              child: Column(
                children: [
                  Image.asset(
                    'images/demoLogo.png',
                    height: 90,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Welcome to RIP coding",
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "User name",
                      prefixIcon: Icon(Icons.person),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        prefixIcon: Icon(Icons.vpn_key_sharp),
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.remove_red_eye_rounded),
                        )),
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Confirm password",
                      prefixIcon: Icon(Icons.vpn_key_sharp),
                    ),
                    obscureText: false,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 50,
                    width: context.width,
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: Text("Signup_Bro"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
