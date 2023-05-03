import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:myapp_anur/widgets/widgetUtilities.dart';
// import 'package:image_picker/image_picker.dart';

class AboutController extends GetxController {
  final formInputListResource = [
    {"titleField": "Display name:", "hintText": "Enter your name"},
    {"titleField": "Gender:", "hintText": "Select Gender"},
    {"titleField": "Birthday:", "hintText": "DD MM YYYY"},
    {"titleField": "Horoscope:", "hintText": "--"},
    {"titleField": "Zodiac:", "hintText": "--"},
    {"titleField": "Height:", "hintText": "Add height"},
    {"titleField": "weight:", "hintText": "Add weight"}
  ];

  List<Widget> getFieldListWidget() {
    List<Widget> widgets = List.empty(growable: true);

    for (Map map in formInputListResource) {
      if (map['titleField'] == 'Gender:') {
        widgets.add(dropDownBuild());
      } else {
        widgets.add(textFieldBuild(map['titleField'], map['hintText'],
            map['titleField'] == 'Gender:' ? false : true));
      }
    }
    return widgets;
  }

  // void getImage(int numPhoto) async {
  //   var imagePicker = ImagePicker();
  //   XFile? image = await imagePicker.pickImage(
  //       source: ImageSource.camera,
  //       imageQuality: 50,
  //       preferredCameraDevice: CameraDevice.front);
  //   update();
  // }
}
