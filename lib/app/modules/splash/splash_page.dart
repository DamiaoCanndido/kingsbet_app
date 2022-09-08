import 'package:flutter/material.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_appbar.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_button.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_textformfield.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KingsbetAppBar(
        title: const Text(
          "KINGSBET",
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const KingsbetTextFormField(
              label: "Email",
              textAlign: TextAlign.left,
              keyboardType: TextInputType.emailAddress,
              obscureText: false,
              enabled: true,
            ),
            const SizedBox(
              height: 20,
            ),
            KingsbetButton(
              label: "ENTRAR",
              width: double.infinity,
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
