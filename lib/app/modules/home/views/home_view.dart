import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:user_app/app/modules/home/views/item_information.dart';
import 'package:user_app/app/modules/login/controllers/login_controller.dart';
import 'package:user_app/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({super.key});
  LoginController loginController = Get.find();
  final double coverHeight = 160;
  final double profileHeight = 100;

  @override
  Widget build(BuildContext context) {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Container(
                  color: Colors.blue,
                  margin: EdgeInsets.only(bottom: bottom),
                  child: Image.network(
                    "https://images.unsplash.com/photo-1549778399-f94fd24d4697?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxleHBsb3JlLWZlZWR8Mnx8fGVufDB8fHx8fA%3D%3D",
                    width: double.infinity,
                    height: coverHeight,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 5,
                  right: 5,
                  child: Container(
                    padding: EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.brown.shade400,
                    ),
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: top,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.grey.shade200, width: 5),
                      color: Colors.white,
                    ),
                    child: CircleAvatar(
                      radius: profileHeight / 2,
                      backgroundColor: Colors.grey.shade800,
                      backgroundImage:
                          NetworkImage("https://thispersondoesnotexist.com/"),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Column(
              children: [
                Text(
                  "Indra Yoga Permana",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Programmer",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Basic Information",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Edit",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ItemInformation(
                    icon: Icons.phone_outlined,
                    title: "081350912242",
                  ),
                  ItemInformation(
                    icon: Icons.email_outlined,
                    title: "indrayogapermana@gmail.com",
                  ),
                  ItemInformation(
                    icon: Icons.calendar_month_outlined,
                    title: "12 July 1988",
                  ),
                  ItemInformation(
                    icon: Icons.place_outlined,
                    title:
                        "Jl Padat karya gn steling Kelurahan Gunung samarinda baru, Kecamatan Balikpapan Barat",
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey.shade300,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "About",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "technology professional focused on designing, coding, and maintaining software solutions to address specific needs or challenges. With expertise in multiple programming languages and a deep understanding of algorithms and data structures, they transform complex requirements into efficient, reliable applications. Known for their logical thinking and problem-solving skills, programmers are detail-oriented, often able to debug and optimize systems to enhance performance and user experience. They typically work closely with other developers, designers, and project managers to bring projects to life, adapting to new technologies and methods to stay relevant in a fast-evolving industry",
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //do logout
          loginController.logout();
        },
        child: Icon(Icons.logout),
      ),
    );
  }
}
