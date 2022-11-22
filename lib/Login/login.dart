import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:movil_proyecto/models/token.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return const LoginMobile();
        },
      ),
    );
  }
}

class LoginMobile extends StatefulWidget {
  const LoginMobile({super.key});

  @override
  State<LoginMobile> createState() => _LoginMobile();
}

class _LoginMobile extends State<LoginMobile> {
  String infotext = "Informe sus datos";
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  String user = 'Alvaro';
  String pass = '1234';
  bool _isObscure = true;
  bool _isVisible = false;
  void validar() async {
    try {
      final res =
          await http.post(Uri.parse('http://localhost:3000/api/auth'), body: {
        "username": username.text,
        "password": password.text,
      });
      print(json.decode(res.body));
      if (res.statusCode == 200) {
        Token token = Token.fromJson(json.decode(res.body));
      }
    } catch (e) {
      print("No se pudo conectar");
    }
    if (user == username.text && pass == password.text) {
      guardatos("Alvaro Alva Chipana");
      Navigator.pushNamed(context, '/home');
    } else {
      if (username.text == '' && password.text == '') {
        Fluttertoast.showToast(
            msg: "Complete los campos",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromRGBO(1, 71, 118, 1),
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        Fluttertoast.showToast(
            msg: "Datos Invalidos",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Color.fromRGBO(1, 71, 118, 1),
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }

  Future<void> guardatos(nombre) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("name", nombre);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: prefer_const_constructors
      backgroundColor: Color.fromRGBO(1, 71, 118, 1),

      body: Center(
        child: Container(
            // ignore: prefer_const_constructors
            constraints: BoxConstraints(minWidth: 400, maxWidth: 500),
            alignment: Alignment.lerp(
                Alignment.topCenter, Alignment.bottomCenter, 0.5),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(1, 71, 118, 1),

              border: Border.all(
                  // ignore: prefer_const_constructors
                  color: Color.fromARGB(1, 71, 118, 1), // Set border color
                  width: 3.0), // Set border width
              borderRadius: BorderRadius.all(
                  Radius.circular(40.0)), // Set rounded corner radius
              // Make rounded corner of border
            ),
            child: SingleChildScrollView(
                padding:
                    // ignore: prefer_const_constructors
                    EdgeInsets.only(top: 30, left: 30, right: 30, bottom: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Image.asset('assets/03.png'),
                    // ignore: prefer_const_constructors
                    Divider(
                      color: Colors.transparent,
                    ),
                    // ignore: prefer_const_constructors
                    Divider(
                      color: Colors.transparent,
                    ),
                    // ignore: prefer_const_constructors
                    Divider(
                      color: Colors.transparent,
                    ),
                    // ignore: prefer_const_constructors
                    Divider(
                      color: Colors.transparent,
                    ),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _isVisible = false;
                        });
                      },
                      controller: username, // Controller for Username
                      decoration: InputDecoration(
                          isDense: true, // Added this

                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: "Username",
                          fillColor: Colors.white,
                          filled: true, //<-- SEE HERE

                          contentPadding: EdgeInsets.all(15)),
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                    ),
                    // ignore: prefer_const_constructors
                    Divider(
                      thickness: 3,
                      color: Colors.transparent,
                    ),
                    TextFormField(
                      onTap: () {
                        setState(() {
                          _isVisible = false;
                        });
                      },

                      controller: password, // Controller for Password
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          hintText: "Password",
                          // ignore: prefer_const_constructors
                          contentPadding: EdgeInsets.all(15),
                          // Adding the visibility icon to toggle visibility of the password field
                          suffixIcon: IconButton(
                            icon: Icon(_isObscure
                                ? Icons.visibility_off
                                : Icons.visibility),
                            onPressed: () {
                              setState(() {
                                _isObscure = !_isObscure;
                              });
                            },
                          )),
                      obscureText: _isObscure,
                    ),
                    // ignore: prefer_const_constructors
                    Divider(
                      color: Colors.transparent,
                    ),
                    // ignore: prefer_const_constructors
                    Divider(
                      color: Colors.transparent,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          validar();
                        },
                        child: Text("Ingresar"),
                        style: ElevatedButton.styleFrom(
                            fixedSize: const Size(60, 50),
                            backgroundColor: Color.fromRGBO(254, 196, 0, 1),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            textStyle: const TextStyle(fontSize: 20))),
                  ],
                ))),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
