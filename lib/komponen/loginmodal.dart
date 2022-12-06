import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:papb/home/main_page.dart';
// import 'package:shared_preferences/shared_preferences.dart';





void showLoginModal(context) {
  final formKey = GlobalKey<FormState>();
  var email,password;
  login() async {
    try {
      var res = await http.post(
      Uri.parse('http://103.187.146.72:3000/api/ngopeee/login'),
      headers: {
        "Accept" : '*/*'
      },
      body: {
        "email" : email,
        "password": password
      }
    );
    if(res.body  == "Login Berhasil"){
      // SharedPreferences localStorage = await SharedPreferences.getInstance();
      // localStorage.setString('token', "asdasd");
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
    } catch (e) {
      print(e);
    }
   }

  showModalBottomSheet(
      context: context,
      builder: (context) {
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
            child : Form(
              key : formKey,
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
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'yourmail@mail.com',
                    ),
                    validator: (emailValue) {
                      if(emailValue == null) {
                        return 'Please Enter your email';
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
                    keyboardType: TextInputType.visiblePassword,
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
                        if(formKey.currentState!.validate()){
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
                      Text(
                        "Klik untuk daftar",
                        style: GoogleFonts.plusJakartaSans(
                          color: const Color.fromARGB(255, 153, 110, 56),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ),
        );
      });
}