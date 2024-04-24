import 'package:flutter/material.dart';
import 'package:gemini/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

import '../widgets/gemini_button.dart';
import '../widgets/gemini_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onPageToggle;

  const LoginPage({
    super.key,
    required this.onPageToggle,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isBusy = false;

  @override
  void initState() {
    super.initState();
    emailController.text = '';
    passwordController.text = '';
    isBusy = false;
  }

  @override
  Widget build(BuildContext context) {
    void signIn() async {
      setState(() {
        isBusy = true;
      });
      final authService = Provider.of<AuthService>(context, listen: false);

      try {
        await authService.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text);
        setState(() {
          isBusy = false;
        });
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
        setState(() {
          isBusy = false;
        });
      }
    }

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
                        'WELCOME BACK!',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "We've missed you",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 42),
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
                      SizedBox(height: 20),
                      GeminiButton(
                        isBusy: isBusy,
                        label: 'Log In',
                        onTap: signIn,
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dont't have an account?"),
                          SizedBox(width: 12),
                          GestureDetector(
                            onTap: widget.onPageToggle,
                            child: Text(
                              'Register now',
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
