// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:myapp_anur/service/apis.dart';
import 'package:myapp_anur/utility/validationModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  Apis apis = Apis();

  final errorNullField = 'can not be blank';
  bool isFormCompleted = false;

  ValidationModel _username = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);

  ValidationModel get username => _username;
  ValidationModel get password => _password;

  void checkFormCompleted() {}

  void fillUserName(String? val) {
    if (val!.isNotEmpty) {
      _username = ValidationModel(val, null);
      if (_password.value != null) {
        isFormCompleted = true;
      }
    } else {
      _username = ValidationModel(null, errorNullField);
      isFormCompleted = false;
    }
    update();
  }

  void fillPassword(String? val) {
    if (val!.isNotEmpty) {
      _password = ValidationModel(val, null);
      if (_username.value != null) {
        isFormCompleted = true;
      }
    } else {
      _password = ValidationModel(null, errorNullField);
      isFormCompleted = false;
    }
    update();
  }

  Future<Map?> login() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map loginMap = Map();
    bool resLogin = await apis.loginAPI(_username.value!, password.value!);
    if (resLogin) {
      prefs.setString('user_mail', "");
      prefs.setString('user_name', _username.value!);

      loginMap['status'] = true;
      loginMap['message'] = 'success';
    } else {
      loginMap['status'] = false;
      loginMap['message'] = 'Invalid username or password';
    }
    return loginMap;
  }
}
