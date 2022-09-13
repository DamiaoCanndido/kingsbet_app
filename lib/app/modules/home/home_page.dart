import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/services/auth_service.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomePage'),
        actions: [
          TextButton(
            onPressed: () {
              Get.find<AuthService>().logout();
            },
            child: const Text("sair"),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
