import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:user_app/app/data/profile.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/app/utils/warning_dialog.dart';
import 'package:user_app/config.dart';

class EditProfileController extends GetxController {
  GetStorage box = GetStorage();

  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController aboutController = TextEditingController();

  RxMap<String, List> errors = RxMap();

  final RxBool isLoading = false.obs;

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

  void updateProfile() async {
    isLoading.value = true;

    var response =
        await http.put(Uri.parse(Config().url + '/api/user/profile'), headers: {
      'Authorization': 'Bearer ${box.read('user')['token']}',
      'Accept': 'application/json',
    }, body: {
      "name": nameController.text,
      "email": emailController.text,
      "job": jobController.text,
      "phone_number": phoneNumberController.text,
      "address": addressController.text,
      "about": aboutController.text,
      "date_of_birth": dateOfBirthController.text
    });

    if (response.statusCode == 200) {
      //TODO
      /*
        update profile in storage
        back to profile page
      */
    } else {
      Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;

      Map<String, dynamic> fieldErrors = data['errors'] as Map<String, dynamic>;
      fieldErrors.forEach((key, value) {
        errors[key] = value as List;
      });

      Get.dialog(
        barrierDismissible: false,
        WarningDialog(
          title: "Update Profile Failed",
          message: data['message'],
          actionButton: ElevatedButton(
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)))),
            onPressed: () {
              isLoading.value = false;
              Get.back();
            },
            child: Text(
              "Close",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          icon: Icons.close,
          iconColor: Colors.red,
        ),
      );
    }
  }
}
