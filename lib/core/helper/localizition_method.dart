import 'package:intl/intl.dart';

class LocalizitionMethod {
  static String getLanguageCode(String language) {
    switch (language) {
      case 'English':
        return 'en';
      case 'Arabic':
        return 'ar';
      default:
        return 'en';
    }
  }

  bool isArabic() {
    return Intl.getCurrentLocale() == 'ar';
  }
}
