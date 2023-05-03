import 'package:flutter/material.dart';
import 'package:myapp_anur/controller/loginController.dart';
import 'package:myapp_anur/screen/about.dart';
import 'package:myapp_anur/screen/register.dart';
import 'package:myapp_anur/service/navigationService.dart';
import 'package:myapp_anur/theme.dart';
import 'package:get/get.dart';
import 'package:myapp_anur/widgets/customFormInput.dart';
import 'package:myapp_anur/widgets/customFormInputPass.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final loginController = Get.put(LoginController());
  bool _obscureText = true;

  void showError(message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Colors.amber,
      content: Text(message),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 20,
          left: 20),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
              gradient: RadialGradient(
                  center: Alignment(1.0, -1.0),
                  radius: 2,
                  colors: [
                Color(0xFF1F4247),
                Color(0xFF0D1D23),
                Color(0xFF09141A)
              ])),
          child: Padding(
            padding: const EdgeInsets.only(left: 23, right: 25),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 10,
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            color: whiteColorBasic,
                            size: 14,
                          ),
                          Text(
                            "Back",
                            style: whiteTextStyleBold.copyWith(fontSize: 14),
                          )
                        ],
                      ),
                    )),
                Expanded(
                    flex: 6,
                    child: GetBuilder<LoginController>(builder: (loginCtl) {
                      return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: const EdgeInsets.only(left: 28),
                              width: double.infinity,
                              child: Text("Login",
                                  style: whiteTextStyleBold.copyWith(
                                      fontSize: 24)),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: CustomFormInput(
                                  obsecureText: false,
                                  errorText: null,
                                  titleForm: "Enter Username/Email",
                                  onChanged: loginCtl.fillUserName),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: CustomFormInputPass(
                                  obsecureText: _obscureText,
                                  errorText: null,
                                  titleForm: "Enter Password",
                                  obsecureFunc: () {
                                    setState(() {
                                      _obscureText = !_obscureText;
                                    });
                                  },
                                  onChanged: loginCtl.fillPassword),
                            ),
                            buttonLogin(),
                            registerLink()
                          ]);
                    }))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget registerLink() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 52, horizontal: 0),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "No account? ",
              style: whiteTextStyleMedium.copyWith(fontSize: 13),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Register.routeName);
              },
              child: Text(
                "Register here",
                style: whiteTextStyleMedium.copyWith(
                    fontSize: 13, decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buttonLogin() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 0),
        child: GetBuilder<LoginController>(builder: (loginCtl) {
          return GestureDetector(
            onTap: () async {
              Map? login = await loginCtl.login();
              if (login!['status'] == true) {
                Navigator.pushNamed(
                    NavigationService.navigatorKey.currentContext!,
                    About.routeName);
              } else {
                showError(login['status']);
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: !loginCtl.isFormCompleted
                      ? []
                      : const [
                          BoxShadow(
                            color: Color.fromRGBO(98, 205, 203, 0.5),
                            spreadRadius: 3,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                          BoxShadow(
                            color: Color.fromRGBO(69, 153, 219, 0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 5), // changes position of shadow
                          ),
                        ],
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color.fromRGBO(98, 205, 203, 1),
                        Color.fromRGBO(69, 153, 219, 1),
                      ])),
              width: double.infinity,
              child: Center(
                  child: Text(
                "Login",
                style: whiteTextStyleBold.copyWith(fontSize: 16),
              )),
            ),
          );
        }));
    ;
  }
}
