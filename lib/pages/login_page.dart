// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_web_libraries_in_flutter, prefer_const_constructors_in_immutables, use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_ui/images/components/my_button.dart';
import 'package:login_ui/images/components/squre_tile.dart';
import 'package:login_ui/images/components/textfeild.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
//textfeilds
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

//signuserin
  void signUsrIn() async {
    showDialog(
        context: context,
        builder: (context) {
          return Center(child: CircularProgressIndicator());
        });

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      //pop circle progress
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      //pop circle progress
      Navigator.pop(context);
      if (e.email == "user-not-found") {
        //show error messege
        wrongEmailMessege();
      } else if (e.email == "wrong-password") {
        //show error messege
        wrongEmailMessege();
      }
    }
  }

  void wrongEmailMessege() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Wrong Email'),
          );
        });
  }

  void wrongPasswordMessege() {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Wrong Password'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 50),
            //logo
            const Icon(Icons.lock, size: 100),

            const SizedBox(height: 50),

            //welcome
            Text(
              'WelcomeBack back',
              style: TextStyle(
                color: Colors.grey[700],
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 25),

            //test feild
            MyTextFeild(
              controller: emailController,
              hintText: 'Email',
              obscureText: false,
            ),

            const SizedBox(height: 10),

            //password
            MyTextFeild(
              controller: passwordController,
              hintText: 'Password',
              obscureText: true,
            ),

            const SizedBox(height: 10),

            //forgot password
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Forgot Password',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            //button
            MyButton(
              onTap: signUsrIn,
            ),

            const SizedBox(height: 50),

            //or coutinue with
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      'or continue with',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Colors.grey[400],
                    ),
                  )
                ],
              ),
            ),

            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SquereTile(imagePath: 'lib/images/google.png'),
                SizedBox(width: 10),
                SquereTile(imagePath: 'lib/images/apple.png')
              ],
            ),

            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'not a member',
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(width: 4),
                const Text(
                  'RegisterNow',
                  style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
