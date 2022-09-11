import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/mixins/loader_mixin.dart';
import 'package:kingsbet_app/app/core/mixins/messages_mixin.dart';
import 'package:kingsbet_app/app/repositories/auth/auth_repository.dart';

class SignupController extends GetxController with LoaderMixin, MessagesMixin {
  // ignore: unused_field
  final AuthRepository _authRepository;

  final loading = false.obs;
  final message = Rxn<MessageModel>();
  final password = "".obs;

  SignupController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    loaderListener(loading);
    messageListener(message);
    super.onInit();
  }

  String? validateName(String? value) {
    String v = value!.trim();
    if (v.length < 4 || v.isEmpty) {
      return "Nome muito curto.";
    }
    return null;
  }

  String? validateEmail(String? value) {
    String v = value!.trim();
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(v)) {
      return "Email inválido.";
    }
    return null;
  }

  String? validatePassword(String? value) {
    String v = value!.trim();
    password(v);
    if (v.length < 6 || v.isEmpty) {
      return "Senha muito curta";
    }
    return null;
  }

  String? validateConfirmPassword(String? value) {
    String v = value!.trim();
    if (v.length < 6 || v.isEmpty) {
      return "Senha muito curta";
    }
    if (v != password.value) {
      return "Senhas diferentes.";
    }
    return null;
  }
}
