import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();

  final box = GetStorage();
  Map user = {};

  Future getUser() async {
    if (box.read('user') != null) {
      var response = await http.get(
          Uri.parse("https://6ac3-36-85-37-102.ngrok-free.app/api/user"),
          headers: {
            'Authorization': 'Bearer ${box.read('user')['token']}',
          });
      if (response.statusCode == 200) {
        user = json.decode(response.body);
      }
    }
  }

  runApp(
    FutureBuilder(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return MaterialApp(
              home: Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            );
          }
          return GetMaterialApp(
            title: "Application",
            initialRoute:
                user.entries.isNotEmpty ? AppPages.INITIAL : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }),
  );
}
