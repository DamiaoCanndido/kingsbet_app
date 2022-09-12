import 'package:get/get.dart';
import 'package:kingsbet_app/app/core/constants/constants.dart';
import 'package:kingsbet_app/app/modules/signin/signin_binding.dart';
import '../modules/signin/signin_page.dart';
import '../modules/signup/signup_binding.dart';
import '../modules/signup/signup_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: Constants.SIGNUP,
      page: () => const SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: Constants.SIGNIN,
      page: () => const SigninPage(),
      binding: SigninBinding(),
    )
  ];
}
