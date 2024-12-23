import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:user_app/app/routes/app_pages.dart';
import 'package:user_app/app/utils/warning_dialog.dart';
import 'package:user_app/config.dart';

class LoginController extends GetxController {
  final isHidden = true.obs;
  final RxBool isLoading = false.obs;
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();

  final String urlLogin = "/api/login";
  final String urlLogout = "/api/logout";

  final box = GetStorage();

  void login() async {
    isLoading.value = true;
    var response = await http.post(Uri.parse(Config().url + urlLogin),
        body: {"email": username.text, "password": password.text});

    if (response.statusCode == 200) {
      var data = json.decode(response.body);
      if (box.read("user") != null) box.remove("user");
      box.write(
        "user",
        {
          "username": username.text,
          "token": data['accessToken'].toString(),
        },
      );
      isLoading.value = false;
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.dialog(
        barrierDismissible: false,
        WarningDialog(
          title: "Login Failed",
          message: "Username/Password Not Match",
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

  void logout() async {
    var response =
        await http.post(Uri.parse(Config().url + urlLogout), headers: {
      'Authorization': 'Bearer ${box.read('user')['token']}',
    });

    var data = json.decode(response.body);
    if (response.statusCode == 200) {
      print(data);
    }
    if (box.read("user") != null) box.remove("user");
    Get.offAllNamed(Routes.LOGIN);
  }
}
