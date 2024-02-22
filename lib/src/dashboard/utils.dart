import 'package:intl/intl.dart';

String formatDateTime(String dateTimeString) {
  // Parse the date string to a DateTime object
  DateTime dateTime = DateTime.parse(dateTimeString);

  // Get today's date without time
  DateTime today = DateTime.now();
  today = DateTime(today.year, today.month, today.day);

  // Format the date based on comparison
  if (dateTime.isAfter(today)) {
    // If date is today, display only time
    return DateFormat('HH:mm').format(dateTime);
  } else {
    // If date is before today, display only date
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
}
shortString(String str, [amount = 2, trailingDot = false]) {
  if (str.isEmpty) {
    return "";
  } else {
    return str[0].toUpperCase() +
        str.substring(1, (str.length > amount) ? amount : str.length) +
        (trailingDot && str.length > amount ? "..." : "");
  }
}