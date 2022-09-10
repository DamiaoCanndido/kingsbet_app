import '../../models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> signup(
    String name,
    String email,
    String password,
    String confirmPassword,
  );

  Future<UserModel> signin(
    String email,
    String password,
  );
}
