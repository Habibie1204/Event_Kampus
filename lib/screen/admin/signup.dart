import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';
import 'dart:convert';
import 'package:project_kelas/screen/login.dart';

import 'package:project_kelas/screen/admin/home_screen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _LoginState();
}

class _LoginState extends State<SignUp> {
  var _controllernama = TextEditingController();
  var _controllerUsername = TextEditingController();
  var _controllerPass = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  void signUp() async {
    final url = Uri.parse('http://192.168.43.181:8080/api_kelas/signUp.php');
    final body = {
     'nama': _controllernama.text,
      'username': _controllerUsername.text,
      'pass': _controllerPass.text
    };
    try {
      final response = await http.post(
        url,
        body: body,
      );
      final data = jsonDecode(response.body);
      if (data['success'] == true) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      } else {
        print('Gagal mendaftar');
      }
    } catch (error) {
      print(error);
    }
  }
  
  @override
  void initState() {
    super.initState();
    _controllernama.clear();
    _controllerUsername.clear();
    _controllerPass.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color.fromARGB(255, 68, 182, 231),
                      Color.fromARGB(255, 3, 54, 131),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 20, top: 75),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'PENTAS ISLAMI TEKNOKRAT',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: FractionalTranslation(
                        translation: Offset(0.0, -0.02),
                        child: ClipOval(
                          child: Image.network(
                            'https://static.vecteezy.com/system/resources/previews/011/414/253/original/elegant-arabian-banner-with-white-background-and-mosque-free-vector.jpg',
                            fit: BoxFit.cover,
                            width: 200, // Atur lebar gambar
                            height: 200,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Universitas Teknokrat Indonesia",
                    style: TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
                  child: Column(
                    children: [
                       TextFormField(
                        validator: (value) =>
                            value == '' ? 'Jangan Kosong' : null,
                        controller: _controllernama,
                        style: TextStyle(
                          color: Color.fromARGB(255, 92, 92, 92),
                        ),
                        decoration: InputDecoration(
                            hintText: 'Nama',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 92, 92, 92),
                            ),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 92, 92, 92),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 92, 92, 92),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 92, 92, 92),
                                width: 1,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.person,
                              color: Color.fromARGB(255, 10, 102, 177),
                            )),
                      ),
                      SizedBox(height: 15),
                      TextFormField(
                        validator: (value) =>
                            value == '' ? 'Jangan Kosong' : null,
                        controller: _controllerUsername,
                        style: TextStyle(
                          color: Color.fromARGB(255, 92, 92, 92),
                        ),
                        decoration: InputDecoration(
                            hintText: 'username',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 92, 92, 92),
                            ),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 92, 92, 92),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 92, 92, 92),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 92, 92, 92),
                                width: 1,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.people,
                              color: Color.fromARGB(255, 10, 102, 177),
                            )),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      TextFormField(
                        validator: (value) =>
                            value == '' ? 'Jangan Kosong' : null,
                        controller: _controllerPass,
                        style: TextStyle(
                          color: Color.fromARGB(255, 92, 92, 92),
                        ),
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: '***********',
                            hintStyle: TextStyle(
                              color: Color.fromARGB(255, 92, 92, 92),
                            ),
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 92, 92, 92),
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 92, 92, 92),
                                width: 2,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 92, 92, 92),
                                width: 1,
                              ),
                            ),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Color.fromARGB(255, 10, 102, 177),
                            )),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                              onPressed: () {}, child: Text("Forget Password?"))
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromARGB(255, 20, 118, 198)),
                        width: double.infinity,
                        child: InkWell(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              EventDb.register(_controllerUsername.text,
                                  _controllerPass.text);
                              _controllerUsername.clear();
                              _controllerPass.clear();
                            }
                          },
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 12,
                            ),
                            child: TextButton(
                              onPressed: () {
                                signUp();
                                _controllerUsername.clear();
                                _controllerPass.clear();
                              },
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Have An Account?"),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                              );
                            },
                            child: Text("Sign In"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          'developed by kelompok 8',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12.0,
                          ),
                        ),
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
