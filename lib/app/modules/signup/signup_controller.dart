import 'dart:developer';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/mixins/loader_mixin.dart';
import 'package:kingsbet_app/app/core/mixins/messages_mixin.dart';
import 'package:kingsbet_app/app/core/rest_client/rest_client.dart';
import 'package:kingsbet_app/app/repositories/auth/auth_repository.dart';

class SignupController extends GetxController with MessagesMixin, LoaderMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final _password = "".obs;
  final RxBool visiblePassword = false.obs;
  final RxBool visibleConfirmPassword = false.obs;

  SignupController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    messageListener(_message);
    loaderListener(_loading);
    super.onInit();
  }

  void setVisiblePassword() => visiblePassword.value = !visiblePassword.value;
  void setVisibleConfirmPassword() =>
      visibleConfirmPassword.value = !visibleConfirmPassword.value;

  String? validateName(String? value) {
    String v = value!.trim();
    if (v.length < 3 || v.isEmpty) {
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
    _password(v);
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
    if (v != _password.value) {
      return "Senhas diferentes.";
    }
    return null;
  }

  Future<void> signUp({
    required String name,
    required String email,
    required String pw,
    required String cPw,
  }) async {
    try {
      _loading.toggle();
      await _authRepository.signup(
        name.trim(),
        email.trim(),
        pw.trim(),
        cPw.trim(),
      );
      _loading.toggle();

      _message(
        MessageModel(
          title: "Sucesso",
          message: "conta criada",
          type: MessageType.info,
        ),
      );
    } on RestClientException catch (e, s) {
      _loading.toggle();
      log("Erro ao criar conta", error: e, stackTrace: s);

      _message(
        MessageModel(
          title: "Erro",
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log("Erro ao criar conta", error: e, stackTrace: s);

      _message(
        MessageModel(
          title: "Erro",
          message: "Erro ao criar conta",
          type: MessageType.error,
        ),
      );
    }
  }
}
