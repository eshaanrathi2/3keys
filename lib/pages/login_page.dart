import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CredentialsField extends StatelessWidget {
  final dynamic controller;
  final String hintText;
  final bool obscureText;
 
  const CredentialsField({
      super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
    });

  @override
  Widget build(BuildContext context) {
    return TextField(
                controller: controller,
                obscureText: obscureText,
                decoration: InputDecoration(
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black),
                  ),
                  hintText: hintText,
                ),
                style: const TextStyle(
                  fontSize: 18,
                
                ),
              );
  }
}

class SignInButton extends StatelessWidget {
  final void Function()? onTap;
  const SignInButton({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap,
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(horizontal: 48),
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(4),
        ),
        child: const Center(
          child: Text(
            "Enter",
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class SquareGoogleButton extends StatelessWidget {
  final String imagePath;
  const SquareGoogleButton({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(imagePath, height: 40,),
    );
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //credentials controllers
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn() async {

    // show loading circle
    showDialog(
      context:context,
      builder: (context){
        return const Center(child: CircularProgressIndicator());
      },
    );

    try {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
    } 
    on FirebaseAuthException catch (e) {
      // User not found
      if (e.code == 'user-not-found') {
        displayUserNotFound();
        print('User not found');
      } 

      // Wrong password
      else if (e.code == 'wrong-password') {
        // displayWrongPassword();
        print('Cipher incorrect!');
      }
    }
  }
  
  void displayUserNotFound() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('No traveller found with that email.\nEnter correct email or sign up :)'),
        );
      },
    );
  }
    

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset : false,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          // SafeArea: forces UI to not go near edges of the screen.
          
          child: Padding(
            padding: const EdgeInsets.all(24.0),
      
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              // Align to center 
              // mainAxisAlignment: MainAxisAlignment.center,
              
              children: [
                // vertical spacing of 50
                const SizedBox(height: 20),
                // logo
                
                // step into the unknown traveller
                const Text(
                  "Step into the\nunknown, traveler...",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            
                // vertical spacing of 50
                const SizedBox(height: 20),
            
                // create your travellers log
                const Text(
                  "Create your travelers log",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
      
                // vertical spacing of 50
                const SizedBox(height: 30),
            
                // explorer's contact scroll
                
                // create your travellers log
                const Text(
                  "Explorer's Contact Scroll",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      
                // vertical spacing of 50
                const SizedBox(height: 10),
      
                CredentialsField(
                  controller: emailController,
                  hintText: 'ferdinandmagellan@gmail.com',
                  obscureText: false,
                ),
                
                // vertical spacing of 50
                const SizedBox(height: 20),
                
                
                // secret cipher
                const Text(
                  "Secret Cipher",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
      
                // vertical spacing of 50
                const SizedBox(height: 10),
      
                CredentialsField(
                  controller: passwordController,
                  hintText: 'i.e LiveLoveTreasure',
                  obscureText: true,
                ),              
            
                
                // forgot cipher?
                // vertical spacing of 50
                const SizedBox(height: 10),
      
                // secret cipher
                const Text(
                  "Forgot your Cipher?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
      
      
                // enter button
                // vertical spacing of 20
                const SizedBox(height: 20),
                SignInButton(onTap: signUserIn),
      
      
                // Google , Apple sign choice
                // vertical spacing of 30
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: .5,
                          color: Colors.grey,
                        ),
                      ),
                
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'or continue with',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                
                      Expanded(
                        child: Divider(
                          thickness: .5,
                          color: Colors.grey,
                        ),
                      )
                  ],),
                ),
      
                //Google + Apple sign in buttons
                // vertical spacing of 30
                const SizedBox(height: 20),
      
      
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareGoogleButton(imagePath: "lib/images/google-logo.png"),
                    SizedBox(width: 20,),
      
                    SquareGoogleButton(imagePath: "lib/images/apple-logo4 copy.png"),
                ],),
      
      
      
                // Register
                // vertical spacing of 30
                const SizedBox(height: 20),
      
                // secret cipher
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("First time?"),
                    SizedBox(width: 4,),
                    Text(
                      "Create your travelers log!",
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 102, 185),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
      
                
      
            ],),
          ),
        ),
      ),
    );
  }
}