import 'package:get/get.dart';
import 'package:kingsbet_app/app/modules/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/',
      page: () => const SplashPage(),
    )
  ];
}
