import 'package:flutter/material.dart';
import 'package:taekwondo_app/shared/shared.dart';
import 'package:taekwondo_app/ui/components/text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String>? onChanged;
  final TextEditingController? controller;

  const RoundedPasswordField({
    Key? key,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: _obscure,
        onChanged: widget.onChanged,
        controller: widget.controller,
        cursorColor: primaryColor,
        style: normalDark1,
        decoration: InputDecoration(
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: primaryColor,
          ),
          suffixIcon: IconButton(
            icon:
                !_obscure ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
            onPressed: () {
              _obscure = !_obscure;
              setState(() {});
            },
            color: primaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
