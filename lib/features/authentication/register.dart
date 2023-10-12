import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project_3_keys/features/authentication/login_page.dart';
import 'package:project_3_keys/features/home_page.dart';

class SignUpButton extends StatelessWidget {
  final void Function()? onTap;
  const SignUpButton({super.key, required this.onTap});

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

class RegisterUser extends StatefulWidget {
  const RegisterUser({super.key});

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  //credentials controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

Future<void> signUserUp() async {
  try {
    // Get the email and password from the controllers
    // final email = emailController.text;
    // final password = passwordController.text;

    // Create a new user account with the provided email and password
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text,
    );

    // If the user registration is successful, you can navigate to another page, e.g., the home page.
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()), // Replace with the appropriate destination.
    );
  } catch (e) {
    // Handle any registration errors here
    print('Registration failed: $e');
    // You can display an error message to the user or take other actions as needed.
  }
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
              
              children: <Widget>[
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

                // Sign up user / register
                GestureDetector(
                  onTap:signUserUp,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    margin: const EdgeInsets.symmetric(horizontal: 48),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Center(
                      child: Text(
                        "Register",
                        style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
      
      
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
      
      
                // const Row(
                //   mainAxisAlignment: MainAxisAlignment.center,
                //   children: [
                //     SquareGoogleButton(imagePath: "lib/assets/auth_page/apple-logo.png"),
                //     SizedBox(width: 20,),
      
                //     SquareGoogleButton(imagePath: "lib/assets/auth_page/google-logo.png"),
                // ],),
      
      
      
                // Register
                // vertical spacing of 30
                const SizedBox(height: 20),
      
                // secret cipher
                // register user
                GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already a traveller?"),
                      SizedBox(width: 4),
                      Text(
                        "Goto login page!",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 102, 185),
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ],
                  ),
                )
      
                
      
            ],),
          ),
        ),
      ),
    );
  }
}