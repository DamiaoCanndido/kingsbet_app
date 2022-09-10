import 'dart:developer';
import 'package:kingsbet_app/app/core/rest_client/rest_client.dart';
import 'package:kingsbet_app/app/models/user_model.dart';
import 'auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl(RestClient restClient) : _restClient = restClient;

  @override
  Future<UserModel> signup(
    String name,
    String email,
    String password,
    String confirmPassword,
  ) async {
    final response = await _restClient.post('/auth/signup', {
      "name": name,
      "email": email,
      "password": password,
      "confirmPassword": confirmPassword,
    });

    var message = "";

    if (response.hasError) {
      message = response.body['error'];

      log(
        message,
        error: response.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException(message);
    }
    return UserModel.fromMap(response.body);
  }

  @override
  Future<UserModel> signin(String email, String password) async {
    final response = await _restClient.post('/auth/signin', {
      "email": email,
      "password": password,
    });

    var message = "";

    if (response.hasError) {
      message = response.body['error'];

      log(
        message,
        error: response.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientException(message);
    }
    return UserModel.fromMap(response.body);
  }
}
