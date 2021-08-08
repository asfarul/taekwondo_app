import 'package:flutter/material.dart';
import 'package:taekwondo_app/shared/shared.dart';
import 'package:taekwondo_app/ui/components/text_field_container.dart';

class RoundedInputField extends StatelessWidget {
  final String? hintText;
  final IconData icon;
  final String? value;
  final bool isEnable;
  final TextInputType textInputType;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final formKey;

  RoundedInputField({
    Key? key,
    this.value,
    this.hintText,
    this.isEnable = true,
    this.controller,
    this.textInputType = TextInputType.text,
    this.icon = Icons.person,
    this.onChanged,
    this.onTap,
    this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: Theme(
        data: ThemeData(disabledColor: darkGrey),
        child: GestureDetector(
          onTap: onTap,
          child: TextField(
            onChanged: onChanged,
            enabled: isEnable,
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
              hintStyle: normalDark1.copyWith(color: Colors.grey),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
