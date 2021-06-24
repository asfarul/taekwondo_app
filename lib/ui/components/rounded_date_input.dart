import 'package:flutter/material.dart';
import 'package:taekwondo_app/ui/components/rounded_input_field.dart';
import 'package:taekwondo_app/utils/commons.dart';

class RoundedDateInput extends StatefulWidget {
  final Function onSelectDate;
  const RoundedDateInput(this.onSelectDate, {Key? key}) : super(key: key);

  @override
  _RoundedDateInputState createState() => _RoundedDateInputState();
}

class _RoundedDateInputState extends State<RoundedDateInput> {
  DateTime? _pickedDate;
  TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: RoundedInputField(
        hintText: 'Tanggal Lahir Anda',
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
      lastDate: DateTime.now(),
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
