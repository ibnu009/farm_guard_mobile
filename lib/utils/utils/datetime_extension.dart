import 'package:intl/intl.dart';

extension DateFormatExtension on DateTime {
  String formatDate() {
    return DateFormat('yyyy-MM-dd').format(this);
  }
}