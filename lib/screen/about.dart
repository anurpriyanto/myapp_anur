import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:myapp_anur/controller/aboutController.dart';
import 'package:myapp_anur/controller/loginController.dart';
import 'package:myapp_anur/controller/registerController.dart';
import 'package:myapp_anur/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

class About extends StatefulWidget {
  const About({super.key});

  static const routeName = '/about';

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final aboutController = Get.put(AboutController());
  final loginController = Get.put(LoginController());
  final registerController = Get.put(RegisterController());

  XFile? image;

  final ImagePicker picker = ImagePicker();

  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  //show popup dialog
  void myAlert() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            title: Text('Please choose media to select'),
            content: Container(
              height: MediaQuery.of(context).size.height / 6,
              child: Column(
                children: [
                  ElevatedButton(
                    //if user click this button, user can upload image from gallery
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.gallery);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.image),
                        Text('From Gallery'),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    //if user click this button. user can upload image from camera
                    onPressed: () {
                      Navigator.pop(context);
                      getImage(ImageSource.camera);
                    },
                    child: Row(
                      children: [
                        Icon(Icons.camera),
                        Text('From Camera'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(color: Color.fromRGBO(9, 20, 26, 1)),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
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
                          Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(context, '/');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_back_ios,
                                        color: whiteColorBasic,
                                        size: 14,
                                      ),
                                      Text(
                                        "Back",
                                        style: whiteTextStyleBold.copyWith(
                                            fontSize: 14),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: GetBuilder<LoginController>(
                                  builder: (loginCtl) {
                                return Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    loginController.username.value == null
                                        ? registerController.username.value!
                                        : loginController.username.value!,
                                    style: whiteTextStyleBold.copyWith(
                                        fontSize: 14),
                                  ),
                                );
                              })),
                          Expanded(
                              flex: 1,
                              child: Icon(
                                Icons.more_horiz,
                                color: whiteColorBasic,
                              ))
                        ],
                      ),
                    )),
                Expanded(
                    flex: 6,
                    child: Container(
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          children: [
                            cardProfile(),
                            cardAbout(),
                            cardInterest()
                          ],
                        ),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardProfile() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(22, 35, 41, 1),
      ),
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 12),
      height: 190,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(12),
                alignment: Alignment.bottomLeft,
                height: double.infinity,
                child: Text(
                  loginController.username.value == null
                      ? registerController.username.value!
                      : loginController.username.value!,
                  style: whiteTextStyleBold.copyWith(fontSize: 16),
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(12),
                alignment: Alignment.topRight,
                height: double.infinity,
                child: Icon(
                  Icons.edit,
                  color: whiteColorBasic,
                  size: 16,
                )),
          ),
        ],
      ),
    );
  }

  Widget cardAbout() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(22, 35, 41, 1),
      ),
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 12),
      padding: EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      child: Column(
        children: [_cardAboutHeader(), _cardAboutAddImage(), _cardAboutForm()],
      ),
    );
  }

  Widget _cardAboutForm() {
    return Container(
      margin: EdgeInsets.only(bottom: 25),
      child: Column(
        children: aboutController.getFieldListWidget(),
      ),
    );
  }

  Widget _cardAboutHeader() {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "About",
              style: whiteTextStyleBold.copyWith(
                  fontSize: 14, color: Color.fromRGBO(255, 255, 255, 1)),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Save & Update",
                style: TextStyle(
                    color: Color.fromRGBO(148, 120, 62, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500)),
          )
        ],
      ),
    );
  }

  Widget _cardAboutAddImage() {
    return Container(
      // padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            height: 57,
            width: 57,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(17),
                color: Color.fromRGBO(255, 255, 255, 0.08)),
            child: image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      //to show image, you type like this.
                      File(image!.path),
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                      height: 300,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      myAlert();
                    },
                    child: const Icon(
                      Icons.add,
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                  ),
          ),
          Text(
            "Add image",
            style: whiteTextStyleMedium.copyWith(
                fontSize: 12, color: Color.fromRGBO(255, 255, 255, 1)),
          )
        ],
      ),
    );
  }

  Widget cardInterest() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromRGBO(22, 35, 41, 1),
      ),
      margin: EdgeInsets.symmetric(horizontal: 3, vertical: 12),
      height: 109,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
                padding: EdgeInsets.all(12),
                alignment: Alignment.bottomLeft,
                height: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Text(
                          "Interest",
                          style: whiteTextStyleBold.copyWith(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Add in your interest to find a better match",
                            style: whiteTextStyleMedium.copyWith(
                                fontSize: 14,
                                color: Color.fromRGBO(255, 255, 255, 0.52)),
                          ),
                        ))
                  ],
                )),
          ),
          Expanded(
            flex: 1,
            child: Container(
                padding: EdgeInsets.all(12),
                alignment: Alignment.topRight,
                height: double.infinity,
                child: Icon(
                  Icons.edit,
                  color: whiteColorBasic,
                  size: 16,
                )),
          ),
        ],
      ),
    );
  }
}
