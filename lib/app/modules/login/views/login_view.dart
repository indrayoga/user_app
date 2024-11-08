import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:user_app/app/modules/login/views/login_button.dart';
import 'package:user_app/app/modules/login/views/login_text_field.dart';
import 'package:user_app/app/routes/app_pages.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({super.key});
  LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                //logo
                const SizedBox(
                  height: 50,
                ),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                //welcome
                const SizedBox(
                  height: 50,
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                //form
                LoginTextField(
                  controller: loginController.username,
                  hintText: 'Username',
                  obscureText: false,
                  icon: Icon(Icons.key),
                ),
                const SizedBox(
                  height: 10,
                ),
                Obx(() => LoginTextField(
                      controller: loginController.password,
                      hintText: 'Password',
                      obscureText: loginController.isHidden.value,
                      icon: Icon(Icons.remove_red_eye),
                    )),
                //forgot password

                //login button
                const SizedBox(
                  height: 25,
                ),
                Obx(() => LoginButton(
                      onTap: loginController.login,
                      isLoading: loginController.isLoading.value,
                    )),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Not a member?",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () => Get.toNamed(Routes.LOGIN),
                        child: Text(
                          "Register Now",
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
