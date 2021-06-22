import 'package:flutter/material.dart';
import 'package:taekwondo_app/shared/shared.dart';
import 'package:taekwondo_app/ui/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  const RoundedInputField({
    Key? key,
    this.hintText,
    this.controller,
    this.textInputType = TextInputType.text,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        keyboardType: textInputType,
        cursorColor: primaryColor,
        style: normalDark1,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: primaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
