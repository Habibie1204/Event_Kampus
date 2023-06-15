import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_pref.dart';
import 'package:project_kelas/screen/admin/list_panitia.dart';
import 'package:project_kelas/screen/admin/list_user.dart';
import 'package:project_kelas/screen/login.dart';
import 'package:project_kelas/screen/admin/profile_screen.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  // ...

  final TextEditingController nameController = TextEditingController();
  final TextEditingController npmController = TextEditingController();
  final TextEditingController prodiController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController asalController = TextEditingController();
  final TextEditingController genderController = TextEditingController();

  List<String> genderOptions = [
    'Male',
    'Female'
  ]; // Options for gender selection

  String? selectedGender; // Track the selected gender

  void saveProfile() {
    String name = nameController.text;
    String npm = npmController.text;
    String prodi = prodiController.text;
    String phone = phoneController.text;
    String asal = asalController.text;
    String gender = selectedGender ??
        ''; // Use the selected gender, or empty string if not selected

    // ...

    print('Nama: $name');
    print('NPM: $npm');
    print('Program Studi: $prodi');
    print('Nomor Telepon: $phone');
    print('Asal: $asal');
    print('Gender: $gender');
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Profile',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: npmController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: prodiController,
              decoration: InputDecoration(labelText: 'Program Studi'),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Nomor Telepon'),
            ),
            SizedBox(height: 8),
            TextFormField(
              controller: asalController,
              decoration: InputDecoration(labelText: 'Asal Sekolah'),
            ),
            SizedBox(height: 8),
            DropdownButtonFormField<String>(
              value: selectedGender,
              decoration: InputDecoration(labelText: 'Gender'),
              items: genderOptions.map((String gender) {
                return DropdownMenuItem<String>(
                  value: gender,
                  child: Text(gender),
                );
              }).toList(),
              onChanged: (String? value) {
                selectedGender = value;
              },
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: saveProfile,
              child: Text('Simpan'),
            ),
          ],
        ),
      ),
    );
  }
}
