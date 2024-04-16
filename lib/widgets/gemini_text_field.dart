import 'package:flutter/material.dart';

class GeminiTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  const GeminiTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        cursorHeight: 22,
        cursorColor: Colors.blueGrey.shade600,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey.shade300,
              width: 0.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blueGrey.shade500,
              width: 1,
            ),
          ),
          fillColor: Colors.blueGrey.shade50,
          filled: true,
          hintText: hint,
          hintStyle: TextStyle(color: Colors.blueGrey.shade300),
        ),
      ),
    );
  }
}
