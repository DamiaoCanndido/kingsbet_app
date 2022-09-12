import 'package:get/get.dart';
import 'package:kingsbet_app/app/modules/signin/signin_controller.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/auth/auth_repository_impl.dart';

class SigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );

    Get.lazyPut(
      () => SigninController(
        authRepository: Get.find(),
      ),
    );
  }
}
