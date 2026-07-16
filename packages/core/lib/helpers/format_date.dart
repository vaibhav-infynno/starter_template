import 'package:intl/intl.dart';

String formatDate(DateTime dateTime) {
  return DateFormat("d MMMM yyyy").format(dateTime);
  // return DateFormat("d MMMM • yyyy").format(dateTime);
}
