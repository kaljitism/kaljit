import 'package:flutter/material.dart';

class InputFormField extends StatelessWidget {

  final controller;
  final String hintText;
  final bool obscureText;

  const InputFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText
});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          fillColor: Colors.blueGrey.shade600,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
