import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/controller/c_user.dart';
import 'package:project_kelas/event/event_pref.dart';
import 'package:project_kelas/model/user.dart';
import 'package:project_kelas/screen/admin/home_screen.dart';
import 'package:project_kelas/screen/admin/profile_screen.dart';
import 'package:project_kelas/screen/admin/event_screen.dart';

class CreateEventScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  List<String> competitions = [
    'Dai dan Daiah',
    'Qori dan Qoriah',
    'Tahfiz juz 30',
    'Kaligrafi',
    'Adzan',
    'Cerpen Islami',
    'Desain Poster Islami',
    'Nasyid',
    'Hadroh dan Rebana',
    'LCTI (Lomba cepat tepat islami)'
  ]; // Add a list of available competitions
  List<String> genders = [
    'Laki-laki',
    'Wanita',
  ]; // Add a list of gender options

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Asal Sekolah',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Wajib Diisi';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Daftar lomba',
                ),
                items: competitions.map((String competition) {
                  return DropdownMenuItem<String>(
                    value: competition,
                    child: Text(competition),
                  );
                }).toList(),
                onChanged: (String? value) {
                  // Handle the selected competition
                },
              ),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Gender',
                ),
                items: genders.map((String gender) {
                  return DropdownMenuItem<String>(
                    value: gender,
                    child: Text(gender),
                  );
                }).toList(),
                onChanged: (String? value) {
                  // Handle the selected gender
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Registration successful')),
                    );
                  }
                },
                child: Text('Register'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
