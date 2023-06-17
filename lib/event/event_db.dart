import 'dart:convert';
import 'package:get/get.dart';
import 'package:project_kelas/config/api.dart';
import 'package:project_kelas/event/event_pref.dart';
import 'package:project_kelas/model/panitia.dart';
import 'package:project_kelas/model/peserta.dart';
import 'package:project_kelas/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:project_kelas/screen/admin/add_update_panitia.dart';
import 'package:project_kelas/screen/admin/signup.dart';
import 'package:project_kelas/screen/login.dart';
import 'package:project_kelas/widget/info.dart';

class EventDb {
  static Future<User?> login(String username, String pass) async {
    User? user;

    try {
      var response = await http.post(Uri.parse(Api.login), body: {
        'username': username,
        'pass': pass,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);

        if (responBody['success']) {
          user = User.fromJson(responBody['user']);
          EventPref.saveUser(user);
          Info.snackbar('Login Berhasil');
          Future.delayed(Duration(milliseconds: 1700), () {
            Get.off(
              Login(),
            );
          });
        } else {
          Info.snackbar('Login Gagal');
        }
      } else {
        Info.snackbar('Request Login Gagal');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
static Future<User?> register(String username, String pass) async {
  User? user;

  try {
    var response = await http.post(Uri.parse(Api.signup), body: {
      'username': username,
      'pass': pass,
    });

    if (response.statusCode == 200) {
      var responseBody = jsonDecode(response.body);

      if (responseBody['success']) {
        user = User.fromJson(responseBody['user']);
        EventPref.saveUser(user);
        Info.snackbar('Registrasi Berhasil');
        Future.delayed(Duration(milliseconds: 1700), () {
          Get.off(SignUp());
        });
      } else {
        Info.snackbar('Registrasi Gagal');
      }
    } else {
      Info.snackbar('Request Registrasi Gagal');
    }
  } catch (e) {
    print(e);
  }
  return user;
}


  

  static Future<List<User>> getUser() async {
    List<User> listUser = [];

    try {
      var response = await http.get(Uri.parse(Api.getUsers));

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var users = responBody['user'];

          users.forEach((user) {
            listUser.add(User.fromJson(user));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listUser;
  }

  static Future<String> addUser(
      String name, String username, String pass, String role) async {
    String reason;

    try {
      var response = await http.post(Uri.parse(Api.addUser), body: {
        'name': name,
        'username': username,
        'pass': pass,
        'role': role
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add User Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }

    return reason;
  }

  static Future<void> UpdateUser(
    String id,
    String name,
    String username,
    String pass,
    String role,
  ) async {
    try {
      var response = await http.post(Uri.parse(Api.updateUser), body: {
        'id': id,
        'name': name,
        'username': username,
        'pass': pass,
        'role': role
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Update User');
        } else {
          Info.snackbar('Gagal Update User');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteUser(String id) async {
    try {
      var response =
          await http.post(Uri.parse(Api.deleteUser), body: {'id': id});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete User');
        } else {
          Info.snackbar('Gagal Delete User');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<Panitia>> getPanitia() async {
    List<Panitia> listPanitia = [];

    try {
      var response = await http.get(Uri.parse(Api.getPanitia));

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var panitia = responBody['panitia'];

          panitia.forEach((panitia) {
            listPanitia.add(Panitia.fromJson(panitia));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listPanitia;
  }

  static Future<String> AddPanitia(
      String mhsNpm,
      String mhsNama,
      String mhsAlamat,
      String mhsFakultas,
      String MhsProdi,
      String Pj_lomba) async {
    String reason;

    try {
      var response = await http.post(Uri.parse(Api.addPanitia), body: {
        'mhsNpm': mhsNpm,
        'mhsNama': mhsNama,
        'mhsAlamat': mhsAlamat,
        'mhsFakultas': mhsFakultas,
        'MhsProdi': MhsProdi,
        'Pj_lomba': Pj_lomba,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add Panitia Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }

    return reason;
  }

  static Future<void> UpdatePanitia(
      String mhsNpm,
      String mhsNama,
      String mhsAlamat,
      String mhsFakultas,
      String MhsProdi,
      String Pj_lomba) async {
    try {
      var response = await http.post(Uri.parse(Api.updatePanitia), body: {
        'mhsNpm': mhsNpm,
        'mhsNama': mhsNama,
        'mhsAlamat': mhsAlamat,
        'mhsFakultas': mhsFakultas,
        'MhsProdi': MhsProdi,
        'Pj_lomba': Pj_lomba
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Update Panitia');
        } else {
          Info.snackbar('Gagal Update Panitia');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deletePanitia(String mhsNpm) async {
    try {
      var response = await http
          .post(Uri.parse(Api.deletePanitia), body: {'mhsNpm': mhsNpm});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete Panitia');
        } else {
          Info.snackbar('Gagal Delete Panitia');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<List<Peserta>> getPeserta() async {
    List<Peserta> listPeserta = [];

    try {
      var response = await http.get(Uri.parse(Api.getPeserta));

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var peserta = responBody['peserta'];

          peserta.forEach((peserta) {
            listPeserta.add(Peserta.fromJson(peserta));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listPeserta;
  }

  static Future<String> AddPeserta(
    String nama,
    String email,
    String asal_sekolah,
    String daftar_lomba,
    String gender,
  ) async {
    String reason;

    try {
      var response = await http.post(Uri.parse(Api.addPeserta), body: {
        'nama': nama,
        'email': email,
        'asal_sekolah': asal_sekolah,
        'daftar_lomba': daftar_lomba,
        'gender': gender,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add Peserta Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }

    return reason;
  }

  static Future<void> UpdatePeserta(
    String nama,
    String email,
    String asal_sekolah,
    String daftar_lomba,
    String gender,
  ) async {
    try {
      var response = await http.post(Uri.parse(Api.updatePeserta), body: {
        'nama': nama,
        'email': email,
        'asal_sekolah': asal_sekolah,
        'daftar_lomba': daftar_lomba,
        'gender': gender,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Update Panitia');
        } else {
          Info.snackbar('Gagal Update Panitia');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deletePeserta(String nama) async {
    try {
      var response =
          await http.post(Uri.parse(Api.deletePeserta), body: {'nama': nama});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete Peserta');
        } else {
          Info.snackbar('Gagal Delete Peserta');
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
