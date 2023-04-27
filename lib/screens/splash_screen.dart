import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socialsignup/screens/home_screen.dart';
import 'package:socialsignup/screens/login_screen.dart';

import '../provider/sign_in_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
// init state

  @override
  void initState() {
    final sp = context.read<SignInProvider>();

    super.initState();

    // create a timer for 2 seconds to fetch the splash screen and migrate to a perticular screen

    Timer(const Duration(seconds: 4), () {
      sp.isSignIn == false
          ? Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const LoginScreen()))
          : Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
              height: 80,
              width: 80,
              image: NetworkImage(
                  "https://raw.githubusercontent.com/backslashflutter/socialauth_flutter_firebase/main/assets/logo.png"),
            )
            // const Text('Splash Screen'),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/login');
            //   },
            //   child: const Text('Login'),
            // ),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushNamed(context, '/signup');
            //   },
            //   child: const Text('Signup'),
            // ),
          ],
        ),
      ),
    );
  }
}
