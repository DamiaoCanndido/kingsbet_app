import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kingsbet_app/app/core/bindings/application_binding.dart';
import 'package:kingsbet_app/app/core/ui/kingsbet_ui.dart';
import 'package:kingsbet_app/app/routes/auth_routers.dart';
import 'package:kingsbet_app/app/routes/home_routers.dart';
import 'package:kingsbet_app/app/routes/game_routers.dart';
import 'package:kingsbet_app/app/routes/predict_routers.dart';
import 'package:kingsbet_app/app/routes/splash_routers.dart';

Future<void> main() async {
  await GetStorage.init();
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
      initialBinding: ApplicationBinding(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
        ...GameRouters.routers,
        ...PredictRouters.routers
      ],
      locale: const Locale('pt', 'BR'),
    );
  }
}
