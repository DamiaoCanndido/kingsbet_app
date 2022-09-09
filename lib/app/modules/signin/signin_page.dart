import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_appbar.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_button.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_textformfield.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KingsbetAppBar(
        elevation: 0,
        title: const Text("KINGSBET"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Login',
                style: context.textTheme.headline6?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: context.theme.primaryColorDark,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const KingsbetTextFormField(
                label: "E-mail",
                textAlign: TextAlign.start,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                enabled: true,
                prefix: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.account_circle,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const KingsbetTextFormField(
                label: "Senha",
                textAlign: TextAlign.start,
                keyboardType: TextInputType.visiblePassword,
                obscureText: false,
                enabled: true,
                prefix: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(
                    Icons.lock,
                    size: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              KingsbetButton(
                label: "Entrar",
                onPressed: () {},
                width: double.infinity,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Não possui cadastro?",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.offNamed('/auth/signup');
                    },
                    child: const Text(
                      "clique aqui",
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
