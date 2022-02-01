import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/register/register_page.dart';
import './login_page.dart';

class AuthRouters {
  AuthRouters._();

  static final routers = <GetPage>[
    GetPage(
      name: '/auth/login',
      page: () => const LoginPage(),
    ),
    GetPage(
      name: '/auth/register',
      page: () => const RegisterPage(),
    ),
  ];
}
