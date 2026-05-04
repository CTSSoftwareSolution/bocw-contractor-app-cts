import 'package:intl/intl.dart';

extension DateFormatExtension on String {
  String formatDate({
    required String fromFormat,
    required String toFormat,
  }) {
    try {
      final parsedDate = DateFormat(fromFormat).parse(this);
      return DateFormat(toFormat).format(parsedDate);
    } catch (e) {
      return this;
    }
  }
}

String formatDate(String utcDate) {
  try {
    final dateTime = DateTime.parse(utcDate);
    return DateFormat("dd-MM-yyyy").format(dateTime);
  } catch (e) {
    return utcDate;
  }
}