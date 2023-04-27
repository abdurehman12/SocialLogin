import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.controller,
      required this.hint,
      required this.obsecuretext,
      required this.characterlength});

  final controller;
  final String hint;
  final bool obsecuretext;
  final int characterlength;

  @override
  Widget build(BuildContext context) {
    var hint2 = hint;
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: TextField(
          maxLength: characterlength,
          controller: controller,
          obscureText: obsecuretext,
          decoration: InputDecoration(
            hintText: hint,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
            fillColor: Colors.white,
            filled: true,
          ),
        ));
  }
}
