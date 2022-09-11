import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    toHome();
  }

  Future<void> toHome() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offAllNamed('/auth/signin');
  }
}
