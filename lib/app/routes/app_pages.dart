import 'package:get/get.dart';
import 'package:kedelai_hub/app/modules/livechat/bindings/livechat_binding.dart';
import 'package:kedelai_hub/app/modules/livechat/views/livechat_view.dart';
import 'package:kedelai_hub/app/modules/profile/bindings/profile_binding.dart';
import 'package:kedelai_hub/app/modules/profile/views/profile_view.dart';
import 'package:kedelai_hub/app/modules/register/bindings/register_binding.dart';
import 'package:kedelai_hub/app/modules/register/views/register_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.LIVECHAT,
      page: () => LiveChatView(),
      binding: LiveChatBinding(),
    ),
  ];
}
