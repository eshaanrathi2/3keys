import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_3_keys/pages/home_page.dart';
import 'package:project_3_keys/pages/login_page.dart';

class AuthPage extends StatelessWidget {
  // If user is not logged in then direct him to sign in page
  // Else, display home page
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot){
          if(snapshot.hasData){
            // user has logged in, direct him to HomePage.
            return HomePage();
          }
          else{
            // user is logged out, direct him to LoginPage.
            return LoginPage();
          }
        },
      ),
    );
  }
}