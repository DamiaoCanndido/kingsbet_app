import 'dart:developer';
import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/mixins/loader_mixin.dart';
import 'package:kingsbet_app/app/core/mixins/messages_mixin.dart';
import 'package:kingsbet_app/app/core/rest_client/rest_client.dart';
import 'package:kingsbet_app/app/repositories/auth/auth_repository.dart';

class SigninController extends GetxController with MessagesMixin, LoaderMixin {
  final AuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final _password = "".obs;
  final RxBool visiblePassword = false.obs;

  SigninController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    messageListener(_message);
    loaderListener(_loading);
    super.onInit();
  }

  void setVisiblePassword() => visiblePassword.value = !visiblePassword.value;

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

  Future<void> signIn({
    required String email,
    required String pw,
  }) async {
    try {
      _loading.toggle();
      await _authRepository.signin(email, pw);
      _loading.toggle();
      // TODO: voltar no login

      _message(
        MessageModel(
          title: "Sucesso",
          message: "Bem-Vindo",
          type: MessageType.info,
        ),
      );
    } on RestClientException catch (e, s) {
      _loading.toggle();
      log("Credenciais inválidas", error: e, stackTrace: s);

      _message(
        MessageModel(
          title: "Erro",
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log("Credenciais inválidas", error: e, stackTrace: s);

      _message(
        MessageModel(
          title: "Erro",
          message: "Credenciais inválidas",
          type: MessageType.error,
        ),
      );
    }
  }
}
