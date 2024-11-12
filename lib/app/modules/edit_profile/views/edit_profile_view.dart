import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  const EditProfileView({super.key});
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
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Nama",
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Pekerjaan",
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Email",
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "No Telp",
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.datetime,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Tanggal Lahir",
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 3,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
              label: Text(
                "Alamat",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            keyboardType: TextInputType.multiline,
            maxLines: 5,
            textAlignVertical: TextAlignVertical.top,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              alignLabelWithHint: true,
              label: Text(
                "Tentang Saya",
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.blue,
            ),
            onPressed: () {},
            child: Text(
              "Simpan",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }
}
