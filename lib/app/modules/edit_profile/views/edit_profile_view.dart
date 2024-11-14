import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/edit_profile_controller.dart';

class EditProfileView extends GetView<EditProfileController> {
  EditProfileView({super.key});

  final EditProfileController editProfileController = Get.find();
  late DateTime _selectedDate;

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
            controller: editProfileController.nameController,
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
            controller: editProfileController.jobController,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Job",
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: editProfileController.emailController,
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
            controller: editProfileController.phoneNumberController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Phone Number",
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            controller: editProfileController.dateOfBirthController,
            onTap: () => displayDatePicker(context: context),
            readOnly: true,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text(
                  "Date Of Birth",
                )),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
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
            ),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
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
              "Submit",
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
