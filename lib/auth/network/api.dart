import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network{
  final String _url = 'http://103.187.146.72:3000/api/ngopeee/login';
  // 192.168.1.2 is my IP, change with your IP address
  var token;
  
  _getToken() async{
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token')!)['token'];
  }

  auth(data) async{
    var result = await http.post(
      Uri.parse('http://103.187.146.72:3000/api/ngopeee/login'),
      body: {
        "email" : "ansarfas23fa@gmail.com",
        "password": "ansar123"
      }
    );
    print(result);
    return result;
  }

  getData(apiURL) async{
    var fullUrl = _url + apiURL;
    await _getToken();
    return await http.get(
      Uri.parse(fullUrl),
      headers: _setHeaders(),
    );
  }

  _setHeaders() => {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };
}