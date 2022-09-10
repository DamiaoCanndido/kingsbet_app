import 'package:get/get.dart';
import 'package:kingsbet_app/app/repositories/auth/auth_repository.dart';

class SignupController extends GetxController {
  final AuthRepository _authRepository;

  SignupController({required AuthRepository authRepository})
      : _authRepository = authRepository;
}
