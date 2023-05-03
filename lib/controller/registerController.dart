// ignore_for_file: file_names

import 'package:get/get.dart';
import 'package:myapp_anur/service/apis.dart';
import 'package:myapp_anur/utility/validationModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  Apis apis = Apis();

  final errorNullField = 'can not be blank';
  bool isFormCompleted = false;
  ValidationModel _email = ValidationModel(null, null);
  ValidationModel _username = ValidationModel(null, null);
  ValidationModel _password = ValidationModel(null, null);
  ValidationModel _passwordConfirm = ValidationModel(null, null);

  ValidationModel get email => _email;
  ValidationModel get username => _username;
  ValidationModel get password => _password;
  ValidationModel get passwordConfirm => _passwordConfirm;

  void fillUserName(String? val) {
    if (val!.isNotEmpty) {
      _username = ValidationModel(val, null);
      if (_password.value != null && _email.value != null) {
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
      if (_username.value != null && _email.value != null) {
        isFormCompleted = true;
      }
    } else {
      _password = ValidationModel(null, errorNullField);
      isFormCompleted = false;
    }
    update();
  }

  void fillPasswordConfirm(String? val) {
    if (val!.isNotEmpty) {
      _passwordConfirm = ValidationModel(val, null);
      if (_username.value != null && _email.value != null) {
        isFormCompleted = true;
      }
    } else {
      _passwordConfirm = ValidationModel(null, errorNullField);
      isFormCompleted = false;
    }
    update();
  }

  bool confirmPassword() {
    if (_passwordConfirm.value != _password.value) {
      _passwordConfirm.error = "Password not match";
      update();
      return false;
    } else {
      return true;
    }
  }

  void fillEmail(String? val) {
    if (val!.isNotEmpty) {
      _email = ValidationModel(val, null);
      if (_username.value != null && _password.value != null) {
        isFormCompleted = true;
      }
    } else {
      _email = ValidationModel(null, errorNullField);
      isFormCompleted = false;
    }
    update();
  }

  Future<Map?> register() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map registrasiMap = Map();
    bool resLogin =
        await apis.registerAPI(password.value!, email.value!, username.value!);
    if (resLogin) {
      prefs.setString('user_mail', email.value!);
      prefs.setString('user_name', username.value!);

      registrasiMap['status'] = true;
      registrasiMap['message'] = 'success';
    } else {
      registrasiMap['status'] = false;
      registrasiMap['message'] = 'User already exist';
    }
    return registrasiMap;
  }
}
