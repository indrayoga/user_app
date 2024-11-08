import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user_app/app/modules/login/controllers/login_controller.dart';

class LoginTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;
  final icon;

  final LoginController loginController = Get.find();

  LoginTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  loginController.isHidden.toggle();
                },
                icon: icon),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.shade400,
              ),
            ),
            fillColor: Colors.grey.shade200,
            filled: true,
            hintText: hintText,
            hintStyle: TextStyle(
              color: Colors.grey[500],
            )),
      ),
    );
  }
}
