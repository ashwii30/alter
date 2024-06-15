// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'Firebase options/firebase_options.dart';
import 'Login/login_pg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Home Page/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(LoginApp());
}

class LoginApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FutureBuilder(
        future: checkAuthStatus(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            if (snapshot.data == true) {
              return HomePage();
            } else {
              return LoginPage();
            }
          }
        },
      ),
    );
  }

  Future<bool> checkAuthStatus() async {
    final user = FirebaseAuth.instance.currentUser;
    return user != null;
  }
}
