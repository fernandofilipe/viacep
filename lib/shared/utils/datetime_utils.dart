import 'package:intl/intl.dart';
import 'package:viacep/shared/constants.dart';

class DateTimeUtils {
  static String dateToString(DateTime date) {
    return DateFormat.yMd(Constants.appLocale).format(date);
  }
}
