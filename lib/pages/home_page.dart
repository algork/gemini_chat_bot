import 'package:flutter/material.dart';
import 'package:gemini/widgets/gemini_button.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:provider/provider.dart';

import '../env/env.dart';
import '../services/auth/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Content> history = [];
    late final GenerativeModel _model;
    late final ChatSession _chat;
    final ScrollController _scrollController = ScrollController();
    final TextEditingController _textController = TextEditingController();
    final FocusNode _textFieldFocus = FocusNode();
    bool _loading = false;

    print(Env.API_KEY);
    void signOut() {
      final authService = Provider.of<AuthService>(context, listen: false);
      authService.signOut();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          children: [
            Text('LOGGED IN'),
            GeminiButton(
              label: 'Sign Out',
              icon: Icons.logout,
              onTap: signOut,
            )
          ],
        ),
      ),
    );
  }
}
