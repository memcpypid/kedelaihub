import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../profile/controllers/profile_controller.dart';

class EditInformationView extends StatelessWidget {
  final ProfileController controller = Get.find<ProfileController>();

  final TextEditingController firstNameCtrl = TextEditingController();
  final TextEditingController lastNameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController dateOfBirthCtrl = TextEditingController();

  EditInformationView({super.key}) {
    controller.initEditControllers(
        firstNameCtrl, lastNameCtrl, emailCtrl, dateOfBirthCtrl);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Information'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: firstNameCtrl,
              decoration: const InputDecoration(labelText: 'First Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: lastNameCtrl,
              decoration: const InputDecoration(labelText: 'Last Name'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            Obx(
              () => DropdownButtonFormField<String>(
                value: controller.selectedRole.value,
                items: ['Penjual', 'Pembeli']
                    .map((role) => DropdownMenuItem(
                          value: role,
                          child: Text(role),
                        ))
                    .toList(),
                onChanged: (value) {
                  controller.selectedRole.value = value!;
                },
                decoration: const InputDecoration(labelText: 'Role'),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: dateOfBirthCtrl,
              readOnly: true, // Make it read-only so user uses the DatePicker
              decoration: const InputDecoration(labelText: 'Date of Birth'),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  dateOfBirthCtrl.text =
                      '${pickedDate.toLocal()}'.split(' ')[0];
                }
              },
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  bool success = await controller.updateUser({
                    'firstName': firstNameCtrl.text,
                    'lastName': lastNameCtrl.text,
                    'email': emailCtrl.text,
                    'role': controller.selectedRole.value,
                    'dateOfBirth':
                        dateOfBirthCtrl.text, // Include the date of birth here
                  });
                  if (success) {
                    Get.back();
                    Get.snackbar(
                      'Success',
                      'User information updated successfully!',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.green,
                      colorText: Colors.white,
                    );
                  } else {
                    Get.snackbar(
                      'Error',
                      'Failed to update user information.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.red,
                      colorText: Colors.white,
                    );
                  }
                },
                child: const Text('Save Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
