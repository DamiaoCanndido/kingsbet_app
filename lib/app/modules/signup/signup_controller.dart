import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/mixins/loader_mixin.dart';
import 'package:kingsbet_app/app/core/mixins/messages_mixin.dart';
import 'package:kingsbet_app/app/repositories/auth/auth_repository.dart';

class SignupController extends GetxController with LoaderMixin, MessagesMixin {
  // ignore: unused_field
  final AuthRepository _authRepository;

  final loading = false.obs;
  final message = Rxn<MessageModel>();

  SignupController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(loading);
    messageListener(message);
    super.onInit();
  }

  String? validateName(String? value) {
    if (value == null || value.length < 4 || value.isEmpty) {
      return "Nome muito curto.";
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.length < 4 || value.isEmpty) {
      return "Nome muito curto.";
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.length < 4 || value.isEmpty) {
      return "Nome muito curto.";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (value == null || value.length < 4 || value.isEmpty) {
      return "Nome muito curto.";
    }
    return null;
  }
}
