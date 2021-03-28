import 'dart:io';

import 'package:intl/intl.dart';

class Dates {
  static String formatDateDDMM(String date) {
    return DateFormat('dd/MM').format(HttpDate.parse(date));
  }
}
