import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/constants/constants.dart';
import 'package:kingsbet_app/app/modules/splash/splash_binding.dart';
import 'package:kingsbet_app/app/modules/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
    )
  ];
}
