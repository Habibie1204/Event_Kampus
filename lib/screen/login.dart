import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter/widgets.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _controllerUsername = TextEditingController();
  var _controllerPass = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
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
              padding: EdgeInsets.only(bottom: 20, top: 90),
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
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/UNIVERSITASTEKNOKRAT.png/1200px-UNIVERSITASTEKNOKRAT.png',
                            fit: BoxFit.cover,
                            width: 170, // Atur lebar gambar
                            height: 170,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
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
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
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
                              EventDb.login(_controllerUsername.text,
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
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
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
                          Text("Don't Have Ant Account"),
                          TextButton(onPressed: () {}, child: Text("Sign Up"))
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
