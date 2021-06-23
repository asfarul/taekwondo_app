import 'package:flutter/material.dart';
import 'package:taekwondo_app/shared/shared.dart';
import 'package:taekwondo_app/ui/components/text_field_container.dart';

class RoundedDropdownInput extends StatefulWidget {
  final Function onSelected;
  final List<String> data;
  const RoundedDropdownInput(this.onSelected, this.data, {Key? key})
      : super(key: key);

  @override
  _RoundedDropdownInputState createState() => _RoundedDropdownInputState();
}

class _RoundedDropdownInputState extends State<RoundedDropdownInput> {
  dynamic _selectedValue;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          style: normalGrey1,
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: primaryColor,
          ),
          items: widget.data
              .map(
                (value) => DropdownMenuItem(
                  child: Text(
                    value,
                    style: normalDark1,
                  ),
                  value: value,
                ),
              )
              .toList(),
          onChanged: (val) {
            _selectedValue = val;
            widget.onSelected(_selectedValue);
            setState(() {});
          },
          isExpanded: true,
          value: _selectedValue,
          hint: Text(
            'Pilih Jenis Kelamin',
            style: normalDark1.copyWith(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
