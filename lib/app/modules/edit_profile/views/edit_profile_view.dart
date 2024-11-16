import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  EditProfileView({super.key});

  final EditProfileController editProfileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Obx(() => TextField(
                controller: editProfileController.nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    "Name",
                  ),
                  errorText: editProfileController.errors['name']?.join(","),
                  errorMaxLines: 3,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Obx(() => TextField(
                controller: editProfileController.jobController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    "Job",
                  ),
                  errorText: editProfileController.errors['job']?.join(","),
                  errorMaxLines: 3,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Obx(() => TextField(
                controller: editProfileController.emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    "Email",
                  ),
                  errorText: editProfileController.errors['email']?.join(","),
                  errorMaxLines: 3,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Obx(() => TextField(
                controller: editProfileController.phoneNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text(
                    "Phone Number",
                  ),
                  errorText:
                      editProfileController.errors['phone_number']?.join(","),
                  errorMaxLines: 3,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => TextField(
              controller: editProfileController.dateOfBirthController,
              onTap: () => displayDatePicker(context: context),
              readOnly: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Date Of Birth",
                ),
                errorText:
                    editProfileController.errors['date_of_birth']?.join(","),
                errorMaxLines: 3,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Obx(() => TextField(
                controller: editProfileController.addressController,
                keyboardType: TextInputType.multiline,
                maxLines: 3,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  label: Text(
                    "Address",
                  ),
                  errorText: editProfileController.errors['adress']?.join(","),
                  errorMaxLines: 3,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Obx(() => TextField(
                controller: editProfileController.aboutController,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  alignLabelWithHint: true,
                  label: Text(
                    "About Me",
                  ),
                  errorText: editProfileController.errors['about']?.join(","),
                  errorMaxLines: 3,
                ),
              )),
          SizedBox(
            height: 10,
          ),
          Obx(
            () => ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 10)),
              onPressed: () {
                if (editProfileController.isLoading.isFalse) {
                  editProfileController.updateProfile();
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  editProfileController.isLoading.value
                      ? SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                          ),
                        )
                      : Container(),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Update My Profile",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  displayDatePicker({required BuildContext context}) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      lastDate: DateTime.now(),
      firstDate: DateTime(1945),
      initialDate: editProfileController.dateOfBirthController.text.isEmpty
          ? DateTime.now()
          : DateFormat('dd-MM-yyyy')
              .parse(editProfileController.dateOfBirthController.text),
    );
    if (pickedDate == null) return;
    editProfileController.dateOfBirthController.text =
        DateFormat('dd-MM-yyyy').format(pickedDate);
  }
}
