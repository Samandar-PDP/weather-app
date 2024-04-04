import 'package:intl/intl.dart';

class Constants {
  static const String baseUrl = "https://api.openweathermap.org";
  static String iconUrl(String code) {
    return "https://openweathermap.org/img/wn/$code@2x.png";
  }
  static String kelvinToCelsius(num? kelvin) {
    if(kelvin == null) {
      return "0";
    }
    final d = (kelvin - 273.15).toString();
    final dot = d.indexOf('.');
    return d.substring(0, dot);
  }
  static String currentDate() {
    final now = DateTime.now();
    return DateFormat("EEEE, MMMM d").format(now);
  }
}