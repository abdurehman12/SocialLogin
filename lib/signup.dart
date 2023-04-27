import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:socialsignup/provider/internet_provider.dart';
import 'package:socialsignup/provider/sign_in_provider.dart';
import 'package:socialsignup/screens/home_screen.dart';
import 'package:socialsignup/utils/snack_bar.dart';
//import 'package:iba_course/Calculator/checking.dart';
//import 'package:test_app/components/My_button.dart';
import 'components/My_button.dart';
import 'components/text_box.dart';
//import '../firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

var spacing = const SizedBox(height: 50);

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  // ignore: non_constant_identifier_names
  late Function isDark;

  var items = ["Male", "Female", "Others"];
  String dropdownvalue = 'Male';

  // CollectionReference customRoutesCollections =
  //     FirebaseFirestore.instance.collection('User');
  final UsernameController = TextEditingController();

  final PasswordController = TextEditingController();

  final FirstnameController = TextEditingController();

  final LastnameController = TextEditingController();

  final AgeController = TextEditingController();

  final AddressController = TextEditingController();

  final RoundedLoadingButtonController AuthController =
      RoundedLoadingButtonController();

  // get handleChangeDark => null;

  //Sign in method == will use for navigation

  Future handleEmailAuth() async {
    final sp = context.read<SignInProvider>();
    final ip = context.read<InternetProvider>();
    await ip.checkInternetConnection();

    if (ip.hasInternet == false) {
      openSnackbar(context, "Check your Internet connection", Colors.red);
      AuthController.reset();
    } else {
      // ignore: use_build_context_synchronously
      await sp.SignUpWithEmail(
              context,
              UsernameController,
              PasswordController,
              FirstnameController,
              LastnameController,
              AgeController,
              AddressController)
          .then((value) {
        if (sp.hasError == true) {
          openSnackbar(context, sp.errorCode.toString(), Colors.red);
          AuthController.reset();
        } else {
          // checking whether user exists or not
          sp.checkUserExists().then((value) async {
            if (value == true) {
              // user exists
              await sp.getUserDataFromFirestore(sp.uid).then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        AuthController.success();
                        handleAfterSignIn();
                      })));
            } else {
              // user does not exist
              sp.saveDataToFirestore().then((value) => sp
                  .saveDataToSharedPreferences()
                  .then((value) => sp.setSignIn().then((value) {
                        AuthController.success();
                        handleAfterSignIn();
                      })));
            }
          });
        }
      });
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
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [],
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
            // const Text(
            //   "Welcome back you\'ve been missed",
            //   style: TextStyle(
            //     color: Colors.black,
            //     fontSize: 16,
            //   ),
            // )
            //username

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
            MyTextField(
              controller: PasswordController,
              hint: "Password",
              obsecuretext: true,
              characterlength: 20,
            ),
            //password
            const SizedBox(
              height: 10,
            ),
            MyTextField(
              controller: FirstnameController,
              hint: "FirstName",
              obsecuretext: false,
              characterlength: 20,
            ),
            MyTextField(
              controller: LastnameController,
              hint: "LastName",
              obsecuretext: false,
              characterlength: 20,
            ),
            MyTextField(
              controller: AgeController,
              hint: "Age",
              obsecuretext: false,
              characterlength: 20,
            ),
            // MyTextField(
            //   controller: AddressController,
            //   hint: "Address",
            //   obsecuretext: false,
            //   characterlength: 20,
            // ),

            const Text(
              "Gender",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),

            DropdownButton(
              // Initial Value
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
            const SizedBox(
              height: 10,
            ),

            //sign in button
            const SizedBox(
              height: 25,
            ),
            MyButton(
                onTap: () {
                  handleEmailAuth();
                },
                text: "SignUp"),
            spacing,

            //register now
          ],
        ),
      ))),
    );
  }

  // handle after signin
  handleAfterSignIn() {
    Future.delayed(const Duration(milliseconds: 100)).then((value) {
      // nextScreenReplace(context, const HomeScreen());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }
}
