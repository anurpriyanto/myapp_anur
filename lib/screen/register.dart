import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_anur/controller/registerController.dart';
import 'package:myapp_anur/screen/about.dart';
import 'package:myapp_anur/screen/login.dart';
import 'package:myapp_anur/service/navigationService.dart';
import 'package:myapp_anur/theme.dart';
import 'package:myapp_anur/widgets/customFormInput.dart';
import 'package:myapp_anur/widgets/customFormInputPass.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  static const routeName = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final registerController = Get.put(RegisterController());

  bool _obscureText = true;
  bool _obscureTextConf = true;

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
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/');
                      },
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
                      ),
                    )),
                Expanded(
                    flex: 6,
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: GetBuilder<RegisterController>(builder: (regCtl) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 28),
                                width: double.infinity,
                                child: Text("Register",
                                    style: whiteTextStyleBold.copyWith(
                                        fontSize: 24)),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: CustomFormInput(
                                  obsecureText: false,
                                  titleForm: "Enter Email",
                                  onChanged: regCtl.fillEmail,
                                  errorText: null,
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: CustomFormInput(
                                    obsecureText: false,
                                    errorText: null,
                                    titleForm: "Enter Username/Email",
                                    onChanged: regCtl.fillUserName),
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
                                    onChanged: regCtl.fillPassword),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: CustomFormInputPass(
                                  obsecureText: _obscureTextConf,
                                  errorText: null,
                                  titleForm: "Confirm Password",
                                  onChanged: regCtl.fillPasswordConfirm,
                                  obsecureFunc: () {
                                    setState(() {
                                      _obscureTextConf = !_obscureTextConf;
                                    });
                                  },
                                ),
                              ),
                              regCtl.passwordConfirm.error != null
                                  ? Text(
                                      regCtl.passwordConfirm.error!,
                                      style: TextStyle(color: Colors.amber),
                                    )
                                  : const SizedBox(),
                              buttonRegister(),
                            ]);
                      }),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }

  Widget buttonRegister() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 0),
        child: GetBuilder<RegisterController>(builder: (regCtl) {
          return GestureDetector(
            onTap: () async {
              bool confirmPass = regCtl.confirmPassword();
              print("confirmPass =====> ${confirmPass}");
              if (confirmPass == false) {
                return;
              }
              Map? register = await regCtl.register();
              if (register!['status'] == true) {
                Navigator.pushNamed(
                    NavigationService.navigatorKey.currentContext!,
                    About.routeName);
              }
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                  boxShadow: !regCtl.isFormCompleted
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
                "Register",
                style: whiteTextStyleBold.copyWith(fontSize: 16),
              )),
            ),
          );
        }));
    ;
  }
}
