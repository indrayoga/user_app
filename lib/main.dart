import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:user_app/app/data/profile.dart';
import 'package:user_app/config.dart';

import 'app/routes/app_pages.dart';

void main() async {
  print("start");

  await GetStorage.init();

  final box = GetStorage();
  Map<String, dynamic> data = {};

  Future getUser() async {
    if (box.read('user') != null) {
      var response =
          await http.get(Uri.parse("${Config().url}/api/user"), headers: {
        'Authorization': 'Bearer ${box.read('user')['token']}',
      });

      if (response.statusCode == 200) {
        data = json.decode(response.body);
        Profile userProfile = Profile.fromJson(data);
        box.write('profile', jsonEncode(userProfile.toJson()));
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
                data.entries.isNotEmpty ? AppPages.INITIAL : Routes.LOGIN,
            getPages: AppPages.routes,
          );
        }),
  );
}
