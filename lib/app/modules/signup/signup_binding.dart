import 'package:get/get.dart';
import 'package:kingsbet_app/app/modules/signup/signup_controller.dart';
import 'package:kingsbet_app/app/repositories/auth/auth_repository.dart';
import 'package:kingsbet_app/app/repositories/auth/auth_repository_impl.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => SignupController(
        authRepository: Get.find(),
      ),
    );
  }
}
