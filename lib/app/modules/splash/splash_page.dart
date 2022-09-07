import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_textformfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SPLASH SCREEN"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            KingsbetTextFormField(
              label: "Email",
              textAlign: TextAlign.left,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              enabled: true,
            )
          ],
        ),
      ),
    );
  }
}
