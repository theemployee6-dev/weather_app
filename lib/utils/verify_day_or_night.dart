import 'package:intl/intl.dart';

class VerifyDayOrNight {
  VerifyDayOrNight._();

  static bool verifyDayorNight() {
    DateTime now = DateTime.now();
    String formattedHour = DateFormat('HH').format(now);
    int hour = int.parse(formattedHour);

    return (hour >= 18 || hour < 6);
  }
}
