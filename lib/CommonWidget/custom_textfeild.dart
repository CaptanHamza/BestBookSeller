import 'package:flutter/material.dart';
import '../Globals/colors.dart';

class GetTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintName;
  final IconData? icon;
  final bool? isObscureText;
  final TextInputType? inputType;
  final bool? isEnable;

  const GetTextFormField(
      {super.key,
      this.controller,
      this.hintName,
      this.icon,
      this.isObscureText = false,
      this.inputType = TextInputType.text,
      this.isEnable = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: TextFormField(
        controller: controller,
        obscureText: isObscureText!,
        enabled: isEnable,
        keyboardType: inputType,
        // validator: (value) {
        //   if (value == null || value.isEmpty) {
        //     return 'Please enter $hintName';
        //   }
        //   else if(hintName == "Email" && !validateEmail(value)) {
        //     return 'Please Enter Valid Email';
        //   }
        //   return null;
        // },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30.0)),
            borderSide: BorderSide(color: yellowcolor),
          ),
          prefixIcon: Icon(
            icon,
            color: blackColor,
          ),
          hintText: hintName,
          fillColor: blackColorbutton,
          filled: true,
        ),
      ),
    );
  }
}
