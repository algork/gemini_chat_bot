import 'package:flutter/material.dart';
import 'package:gemini/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

import '../widgets/gemini_button.dart';
import '../widgets/gemini_text_field.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onPageToggle;
  const RegisterPage({
    super.key,
    required this.onPageToggle,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  void createUser() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade500,
          content: Text(
            'Passwords do not match. Please try again.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
      return;
    }
    final authService = Provider.of<AuthService>(context, listen: false);

    try {
      await authService.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red.shade500,
          content: Text(
            e.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'assets/images/gemini_logo.png',
                        width: 100,
                      ),
                      Image.asset(
                        'assets/images/gemini_logo_text.png',
                        width: 150,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 80,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Let's create an account for you!",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 25),
                      GeminiTextField(
                        controller: emailController,
                        hint: 'Email',
                        obscureText: false,
                      ),
                      GeminiTextField(
                        controller: passwordController,
                        hint: 'Password',
                        obscureText: true,
                      ),
                      GeminiTextField(
                        controller: confirmPasswordController,
                        hint: 'Confirm Password',
                        obscureText: true,
                      ),
                      SizedBox(height: 20),
                      GeminiButton(
                        label: 'Create Account',
                        onTap: createUser,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Have an account?'),
                          SizedBox(width: 12),
                          GestureDetector(
                            onTap: widget.onPageToggle,
                            child: Text(
                              'Sign in now',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
