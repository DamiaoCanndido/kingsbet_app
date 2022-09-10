import 'package:get/get.dart';
import '../modules/signin/signin_page.dart';
import '../modules/signup/signup_binding.dart';
import '../modules/signup/signup_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/signup',
      page: () => const SignupPage(),
      binding: SignupBinding(),
    ),
    GetPage(
      name: '/auth/signin',
      page: () => const SigninPage(),
    )
  ];
}
