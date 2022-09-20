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
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
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
          onTap: (value) {
            controller.setTabIndex = value;
          },
          currentIndex: controller.tabIndex,
        ),
      ),
      body: Navigator(
        initialRoute: Constants.LEAGUE,
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: controller.onGenerateRouter,
      ),
    );
  }
}
