import 'package:flutter/material.dart';
import 'package:taekwondo_app/ui/components/rounded_input_field.dart';
import 'package:taekwondo_app/utils/commons.dart';

class RoundedDateInput extends StatefulWidget {
  final Function onSelectDate;
  final DateTime? initDate;
  final String? hint;
  final bool isBirthdate;
  const RoundedDateInput(
    this.onSelectDate,
    this.initDate,
    this.hint,
    this.isBirthdate, {
    Key? key,
  }) : super(key: key);

  @override
  _RoundedDateInputState createState() => _RoundedDateInputState();
}

class _RoundedDateInputState extends State<RoundedDateInput> {
  DateTime? _pickedDate;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    if (widget.initDate != null) {
      _pickedDate = widget.initDate;
      _controller.text = formatDateToStringValue(widget.initDate!)!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: RoundedInputField(
        hintText: widget.hint,
        icon: Icons.calendar_today,
        controller: _controller,
        isEnable: false,
        onTap: _showDatePicker,
      ),
    );
  }

  void _showDatePicker() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 80),
      lastDate: widget.isBirthdate
          ? DateTime.now()
          : DateTime.now().add(Duration(days: 100)),
    );

    if (date != null) {
      _pickedDate = date;
      String value = formatDateToStringValue(date) ?? '-';
      _controller.text = value;
      widget.onSelectDate(value);
      setState(() {});
    }
  }
}
