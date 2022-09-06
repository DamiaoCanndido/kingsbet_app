import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:kingsbet_app/app/core/ui/kingsbet_ui.dart';
import 'package:kingsbet_app/app/routes/splash_routers.dart';

void main() {
  runApp(const KingsbetMainApp());
}

class KingsbetMainApp extends StatelessWidget {
  const KingsbetMainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Kingbet",
      theme: KingsbetUI.theme,
      debugShowCheckedModeBanner: false,
      getPages: [
        ...SplashRouters.routers,
      ],
    );
  }
}
