import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialsignup/screens/home_screen.dart';
//import 'package:iba_course/Calculator/checking.dart';
//import 'package:test_app/components/My_button.dart';
import 'components/My_button.dart';
import 'components/square_tile.dart';
import 'components/text_box.dart';
//import '../firebase_auth/firebase_auth.dart';

var spacing = const SizedBox(height: 50);

class LoginPage extends StatefulWidget {
  //Function isDark;
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // ignore: non_constant_identifier_names

  final UsernameController = TextEditingController();

  // ignore: non_constant_identifier_names
  final PasswordController = TextEditingController();

  //Sign in method == will use for navigation
  Future<void> SignUserIn() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: UsernameController.text, password: PasswordController.text);

      print(credential.user);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()), //checking()),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[375],
      body: SafeArea(
          child: SingleChildScrollView(
              child: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 80,
            ),

            // logo
            const Icon(
              Icons.headphones,
              size: 100,
            ),
            //you have been missed

            const SizedBox(
              height: 20,
            ),
            const Text(
              "Welcome back you\'ve been missed",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            )
            //username
            ,
            const SizedBox(
              height: 25,
            ),
            // ignore: prefer_const_constructors
            MyTextField(
              controller: UsernameController,
              hint: "Username",
              obsecuretext: false,
              characterlength: 50,
            ),
            //password
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: PasswordController,
              hint: "Password",
              obsecuretext: true,
              characterlength: 20,
            ),
            //text saying forget password
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.red),
                    textAlign: TextAlign
                        .right, // this does not work because column is centre alligned
                  ),
                ],
              ),
            ),
            //sign in button
            const SizedBox(
              height: 25,
            ),
            MyButton(
                onTap: () {
                  SignUserIn();
                },
                text: "Login"),
            //register now
          ],
        ),
      ))),
    );
  }
}
