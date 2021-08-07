import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

String? formatDateToStringValue(DateTime date) {
  return DateFormat('MM/dd/yyyy').format(date);
}

String? formatCompleteDateToString(DateTime date) {
  return DateFormat('EEE, dd MMM yyyy').format(date);
}

int? calculateAge(DateTime date) {
  // DateTime birthDate = date;
  // DateTime today = DateTime.now();

  // return today.year - birthDate.year;
  DateTime currentDate = DateTime.now();
  int age = currentDate.year - date.year;
  int month1 = currentDate.month;
  int month2 = date.month;
  if (month2 > month1) {
    age--;
  } else if (month1 == month2) {
    int day1 = currentDate.day;
    int day2 = date.day;
    if (day2 > day1) {
      age--;
    }
  }
  return age;
}
