// ignore_for_file: prefer_const_constructors, prefer_interpolation_to_compose_strings

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey[900],
          actions: [IconButton(onPressed: signOut, icon: Icon(Icons.logout))]),
      body: Center(
        child: Text(
          "Loged In As: " + user.email!,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
