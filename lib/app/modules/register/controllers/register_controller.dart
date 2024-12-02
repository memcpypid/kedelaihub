import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../auth/auth_controller.dart';

class RegisterController extends GetxController {
  final firstNameController = TextEditingController(); // Nama Depan
  final lastNameController = TextEditingController(); // Nama Belakang

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isPasswordVisible = false.obs; // Variabel reaktif
  final AuthController _authController = Get.put(AuthController());
  final dateOfBirthController = TextEditingController(); // Untuk Tanggal Lahir
  var selectedRole = 'Penjual'.obs; // Untuk role
  void Register() async {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    if (email.isEmpty || password.isEmpty || username.isEmpty) {
      Get.snackbar(
          'Information!', 'Please enter username and email and password!',
          backgroundColor: Colors.grey);
      return;
    }
    await _authController.registerUser(email, password);
  }

  bool getIsloading() {
    return _authController.isLoading.value;
  }
}
