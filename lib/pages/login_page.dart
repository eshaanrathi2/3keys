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

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  //credentials controllers
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  //sign user in method
  void signUserIn(){}
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        // SafeArea: forces UI to not go near edges of the screen.
        
        child: Padding(
          padding: const EdgeInsets.all(24.0),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
              // vertical spacing of 50
              const SizedBox(height: 50),
              // logo
              
              // step into the unknown traveller
              const Text(
                "Step into the\nunknown, traveler...",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
          
              // vertical spacing of 50
              const SizedBox(height: 60),
          
              // create your travellers log
              const Text(
                "Create your travelers log",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),

              // vertical spacing of 50
              const SizedBox(height: 60),
          
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
                controller: usernameController,
                hintText: 'ferdinandmagellan@gmail.com',
                obscureText: false,
              ),
              
              // vertical spacing of 50
              const SizedBox(height: 30),
              
              
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
                  color: Colors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),


              // vertical spacing of 70
              const SizedBox(height: 70),

              SignInButton(onTap: signUserIn),


          
              // enter
          ],),
        ),
      ),
    );
  }
}