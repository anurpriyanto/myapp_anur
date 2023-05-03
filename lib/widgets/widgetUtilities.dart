import 'package:flutter/material.dart';
import 'package:myapp_anur/service/navigationService.dart';
import 'package:myapp_anur/theme.dart';

// Initial Selected Value
String dropdownvalue = 'Select gender';
NavigationService _navigationService = NavigationService();
// List of items in our dropdown menu
var items = [
  'Male',
  'Female',
  'Item 5',
];

Widget _buildChip(String label, Color color) {
  return Chip(
    labelPadding: EdgeInsets.all(2.0),
    avatar: CircleAvatar(
      backgroundColor: Colors.white70,
      child: Text(label[0].toUpperCase()),
    ),
    label: Text(
      label,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
    backgroundColor: color,
    elevation: 6.0,
    shadowColor: Colors.grey[60],
    padding: EdgeInsets.all(8.0),
  );
}

Widget textFieldBuild(String titleField, String hintText, bool isFreeText) {
  return Container(
    margin: EdgeInsets.only(bottom: 12),
    child: Row(
      children: [
        Text(
          titleField,
          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.3)),
        ),
        Spacer(),
        Container(
          margin: EdgeInsets.only(left: 29),
          padding: EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: const Color.fromRGBO(255, 255, 255, 0.22),
            ),
            color: Color.fromRGBO(217, 217, 217, 0.06),
          ),
          height: 35,
          width: 202,
          child: TextFormField(
            readOnly: !isFreeText,
            onTap: () {
              if (!isFreeText) {
                showModalBottomSheet<void>(
                  context: NavigationService.navigatorKey.currentContext!,
                  builder: (BuildContext context) {
                    return SizedBox(
                      height: 200,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            const Text('Modal BottomSheet'),
                            ElevatedButton(
                              child: const Text('Close BottomSheet'),
                              onPressed: () => Navigator.pop(context),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            },
            textAlign: TextAlign.end,
            controller: null,
            onChanged: (e) {},
            style: TextStyle(color: whiteColorBasic),
            decoration: InputDecoration(
                hintStyle: const TextStyle(
                    color: Color.fromRGBO(255, 255, 255, 0.3),
                    fontSize: 13,
                    fontWeight: FontWeight.w500),
                hintText: hintText,
                border: InputBorder.none),
          ),
        )
      ],
    ),
  );
}

Widget dropDownBuild() {
  return Row(
    children: [
      Text("Gender:",
          style: TextStyle(color: Color.fromRGBO(255, 255, 255, 0.3))),
      Spacer(),
      Container(
        width: 202,
        alignment: Alignment.centerRight,
        decoration: BoxDecoration(
            border:
                Border.all(color: const Color.fromRGBO(255, 255, 255, 0.22)),
            color: Color.fromRGBO(217, 217, 217, 0.06),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        margin: EdgeInsets.only(top: 5, bottom: 5),
        padding: EdgeInsets.only(right: 5, left: 5),
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 36,
            maxWidth: 202,
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              // Initial Value
              value: dropdownvalue,
              dropdownColor: Color.fromRGBO(14, 25, 31, 1),
              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: ['Select gender', 'Male', 'Female'].map((String item) {
                return DropdownMenuItem(
                  value: item,
                  alignment: Alignment.centerRight,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        item,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            fontSize: 13,
                            color: Color.fromRGBO(255, 255, 255, 0.3)),
                      )),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {},
            ),
          ),
        ),
      ),
    ],
  );
}
