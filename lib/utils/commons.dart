import 'package:intl/date_symbol_data_file.dart';
import 'package:intl/intl.dart';

String? formatDateToStringValue(DateTime date) {
  return DateFormat('MM/dd/yyyy').format(date);
}

String? formatCompleteDateToString(DateTime date) {
  return DateFormat('EEE, dd MMM yyyy').format(date);
}
