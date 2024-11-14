import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:user_app/app/data/profile.dart';

class EditProfileController extends GetxController {
  GetStorage box = GetStorage();

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    Profile userProfile = Profile.fromJson(jsonDecode(box.read('profile')));
    nameController.text = userProfile.name;
    jobController.text = userProfile.job;
    emailController.text = userProfile.email;
    phoneNumberController.text = userProfile.phoneNumber;
    dateOfBirthController.text =
        DateFormat('dd-MM-yyyy').format(userProfile.dateOfBirth);
    addressController.text = userProfile.address;
    aboutController.text = userProfile.about;
  }

  void submit() async {
    //TODO : http request to submit data profile
  }
}
