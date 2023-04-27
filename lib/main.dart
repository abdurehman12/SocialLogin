import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:socialsignup/provider/internet_provider.dart';
import 'package:socialsignup/provider/sign_in_provider.dart';
import 'package:socialsignup/screens/home_screen.dart';
import 'package:socialsignup/screens/login_screen.dart';
//import 'package:socialsignup/screens/home_screen.dart';
import 'package:socialsignup/screens/splash_screen.dart';
import 'package:socialsignup/signup.dart';
//import 'package:socialsignup/signup.dart';
import 'firebase_options.dart';

import 'package:provider/provider.dart';

import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SignInProvider()),
        ChangeNotifierProvider(create: (_) => InternetProvider()),
      ],
      child: MaterialApp(
        home: LoginScreen(),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
