import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/services/auth_service.dart';

class SplashController extends GetxController {
  void checkLogged() {
    Get.putAsync(
      () => AuthService().init(),
    );
  }

  @override
  void onReady() {
    splashDelay();
    super.onReady();
  }

  Future<void> splashDelay() async {
    await Future.delayed(
      const Duration(seconds: 3),
      () => checkLogged(),
    );
  }
}
