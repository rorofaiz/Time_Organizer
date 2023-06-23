import 'package:intl/intl.dart';

class Utils {
  static String toDate(DateTime dateTime) {
    final date = DateFormat.yMMMEd().format(dateTime);
    // ignore: unnecessary_string_interpolations
    return '$date';
  }

  static String toTime(DateTime dateTime) {
    final time = DateFormat.jm().format(dateTime);
    // ignore: unnecessary_string_interpolations
    return '$time';
  }

  static String toDateformate(DateTime dateTime) {
    final date = DateFormat.yMMMMd().format(dateTime);
    return '$date';
  }
}
