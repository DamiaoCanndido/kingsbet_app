import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_appbar.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_button.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_textformfield.dart';
import 'package:kingsbet_app/app/modules/signup/signup_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final controller = Get.find<SignupController>();

  final _formKey = GlobalKey<FormState>();

  final _nameEC = TextEditingController();
  final _emailEC = TextEditingController();
  final _passwordEC = TextEditingController();
  final _confirmPasswordEC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KingsbetAppBar(
        elevation: 0,
        title: const Text("KINGSBET"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.always,
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cadastre-se',
                  style: context.textTheme.headline6?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.theme.primaryColorDark,
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                KingsbetTextFormField(
                  label: "Nome",
                  controller: _nameEC,
                  validator: (value) {
                    return controller.validateName(value);
                  },
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  enabled: true,
                  prefix: const Padding(
                    padding: EdgeInsets.only(right: 8),
                    child: Icon(
                      Icons.person,
                      size: 25,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                KingsbetTextFormField(
                  label: "E-mail",
                  controller: _emailEC,
                  validator: (value) {
                    return controller.validateEmail(value);
                  },
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  enabled: true,
                  prefix: const Padding(
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
                KingsbetTextFormField(
                  label: "Senha",
                  controller: _passwordEC,
                  validator: (value) {
                    return controller.validatePassword(value);
                  },
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  enabled: true,
                  prefix: const Padding(
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
                KingsbetTextFormField(
                  label: "Confirme senha",
                  controller: _confirmPasswordEC,
                  validator: (value) {
                    return controller.validateConfirmPassword(value);
                  },
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  enabled: true,
                  prefix: const Padding(
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
                  label: "Cadastrar",
                  onPressed: () {
                    final formState = _formKey.currentState!.validate();
                    if (formState) {
                      print("PASS");
                    }
                  },
                  width: double.infinity,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Já possui cadastro?",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.offNamed('/auth/signin');
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
      ),
    );
  }
}
