import 'package:flutter/material.dart';
import 'package:myapp_anur/theme.dart';

class CustomFormInputPass extends StatelessWidget {
  const CustomFormInputPass(
      {Key? key,
      required this.titleForm,
      required this.errorText,
      this.onChanged,
      this.obsecureText,
      this.obsecureFunc})
      : super(key: key);

  final String titleForm;
  final Function(String?)? onChanged;
  final String? errorText;
  final bool? obsecureText;
  final Function()? obsecureFunc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 8,
          ),
          Container(
            width: double.infinity,
            height: 45,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromRGBO(255, 255, 255, 0.06),
            ),
            child: Center(
              child: TextFormField(
                controller: null,
                onChanged: onChanged,
                style: TextStyle(color: whiteColorBasic),
                obscureText: obsecureText!,
                decoration: InputDecoration(
                    hintStyle: const TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 0.04),
                        fontSize: 13,
                        fontWeight: FontWeight.w500),
                    hintText: titleForm,
                    errorText: errorText,
                    border: InputBorder.none,
                    suffixIcon: obsecureText != null
                        ? GestureDetector(
                            child: new Icon(obsecureText!
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onTap: obsecureFunc,
                          )
                        : null),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
