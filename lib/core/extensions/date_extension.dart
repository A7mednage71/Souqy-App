import 'package:intl/intl.dart';

extension DateExtension on DateTime {
  String convertDataFormate() {
    final now = DateTime.now();
    return DateFormat('d MMM, y - h:mm a').format(now);
  }
}
