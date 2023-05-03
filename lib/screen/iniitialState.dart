import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_anur/controller/loginController.dart';
import 'package:myapp_anur/theme.dart';

class InitialState extends StatefulWidget {
  const InitialState({super.key});

  @override
  State<InitialState> createState() => _InitialStateState();
}

class _InitialStateState extends State<InitialState> {
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
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "Tukimin",
                                  style:
                                      whiteTextStyleBold.copyWith(fontSize: 14),
                                ),
                              )),
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
                      child: Column(
                        children: [cardProfile(), cardAbout(), cardInterest()],
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
                  "@johndoe123,",
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
      height: 120,
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
                          "About",
                          style: whiteTextStyleBold.copyWith(
                              fontSize: 14,
                              color: Color.fromRGBO(255, 255, 255, 1)),
                        )),
                    Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Add in your your to help others know you better",
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
