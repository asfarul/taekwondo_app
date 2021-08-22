import 'package:flutter/material.dart';
import 'package:taekwondo_app/models/atlet.dart';
import 'package:taekwondo_app/shared/shared.dart';
import 'package:taekwondo_app/ui/components/text_field_container.dart';

class KelasDropdown extends StatefulWidget {
  final Function onSelected;
  final String? initValue;
  final List<Kelas> data;
  final String hint;
  const KelasDropdown(
    this.onSelected,
    this.initValue,
    this.data,
    this.hint, {
    Key? key,
  }) : super(key: key);

  @override
  _KelasDropdownState createState() => _KelasDropdownState();
}

class _KelasDropdownState extends State<KelasDropdown> {
  dynamic _selectedValue;

  @override
  void initState() {
    if (widget.initValue != null) {
      _selectedValue = widget.initValue;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
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
                    value.nama!,
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
            widget.hint,
            style: normalDark1.copyWith(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
