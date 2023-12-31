import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/model/jadwal.dart';
import 'package:project_kelas/model/user.dart';
import 'package:project_kelas/screen/admin/dashboard_admin.dart';
import 'package:project_kelas/screen/admin/home_screen.dart';
import 'package:project_kelas/screen/admin/signup.dart';
import 'package:project_kelas/screen/admin/list_jadwal.dart';


import 'screen/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primaryColor: Asset.colorPrimaryDark,
        scaffoldBackgroundColor: Colors.white,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Login(),
        '/dashboard': (context) => DashboardAdmin(),
        '/signup': (context) => SignUp(),
        '/jadwal': (context) => ListJadwal(),


        // '/signup' : (context) => signup(),
      },
    );
  }
}
