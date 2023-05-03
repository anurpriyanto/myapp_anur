import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Apis {
  Future<bool> loginAPI(String password, String email) async {
    var body = {'password': password, 'email': email};
    final uri = Uri.http('techtest.youapp.ai', '/api/login', body);
    final headers = {HttpHeaders.contentTypeHeader: 'application/json'};
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> registerAPI(String password, String email, String name) async {
    var body = {'name': name, 'password': password, 'email': email};

    var response2 = await http
        .post(Uri.parse("http://techtest.youapp.ai/api/register"), body: body);

    print("object RESPONSE REGISTER ::: ${jsonDecode(response2.body)}");
    if (response2.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
