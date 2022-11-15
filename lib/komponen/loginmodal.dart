import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:papb/auth/network/api.dart';
import 'package:papb/home/main_page.dart';
import 'package:papb/komponen/registermodal.dart';
import 'package:papb/main.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';

class LoginModal extends StatefulWidget {
  const LoginModal({super.key});

  @override
  State<LoginModal> createState() => _LoginModalState();
}

class _LoginModalState extends State<LoginModal> {
  String _selectedItem = '';
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email,password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;
  bool isChecked = false;

  showHide(){
    setState(() => {
      _secureText = !_secureText
    });
  }


  @override
  Widget build(BuildContext context) {
    return Container(
            height: 360,
            color: Color(0xFF737373),
            child: Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                ),
              ),
              child: Form(
                key:_formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Text(
                      "Email",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'yourmail@mail.com',
                      ),
                      validator: (emailValue) {
                          if(emailValue == null){
                                return 'Please enter your email';
                          }
                          email = emailValue;
                          return null;
                      },
                    ),
                    SizedBox(height: 16),
                    Text(
                      "Kata Sandi",
                      style: GoogleFonts.plusJakartaSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 4),
                    TextFormField(
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '********',
                      ),
                      validator: (passwordValue){
                        if(passwordValue == null){
                          return 'Please enter your password';
                        }
                        password = passwordValue;
                        return null;
                      }
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Checkbox(
                            checkColor: Colors.white,
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            }),
                        SizedBox(width: 4),
                        Text(
                          "Simpan Kata Sandi",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 153, 110, 56),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      width: 1000,
                      height: 48,
                      child: InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                              login();
                            }
                        },
                        child: const Center(
                          child: Text('Masuk',
                              style: TextStyle(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              )),
                        ),
                      ),
                    ),
                    SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Belum punya akun?",
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(width: 4),
                        InkWell(
                          child : Text(
                          "Klik untuk daftar",
                          style: GoogleFonts.plusJakartaSans(
                            color: const Color.fromARGB(255, 153, 110, 56),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onTap: () {Navigator.pushReplacement(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => RegisterModal()
                            ),
                        );},
                        )
                      ],
                    ),
                  ],
                ),
              )
            ),
          );
  }

  login() async {
    setState(() {
      _isLoading = true;
    });
    var res = await http.post(
      Uri.parse('http://103.187.146.72:3000/api/ngopeee/login'),
      body: {
        "email" : email,
        "password": password
      }
    );
    
    if(res.body  == "Login Berhasil"){
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', "asdasd");
      // localStorage.setString('user', json.encode(res.body['user']));
        Navigator.pushReplacement(
          context,
          new MaterialPageRoute(
              builder: (context) => MainPage()
          ),
      );
    } else {
      print("Login Gagal");
    }
    setState(() {
      _isLoading = false;
    });
  }
}
