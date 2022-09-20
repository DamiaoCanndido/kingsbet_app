import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/ui/widgets/kingsbet_appbar.dart';
import 'package:kingsbet_app/app/modules/home/home_controller.dart';
import '../../core/constants/constants.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: KingsbetAppBar(
        elevation: 0,
        title: const Text("KINGSBET"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.shield_outlined),
            label: "Ligas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shield_rounded),
            label: "Minhas",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app),
            label: "Sair",
          ),
        ],
        onTap: (value) {},
        currentIndex: 0,
      ),
      body: Navigator(
        initialRoute: Constants.LEAGUE,
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGenerateRouter,
      ),
    );
  }
}
