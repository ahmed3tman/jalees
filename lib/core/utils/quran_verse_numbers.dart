// ملف للأرقام المزخرفة كما في المصحف الشريف
class QuranVerseNumbers {
  // خريطة لتحويل الأرقام العادية إلى أرقام مزخرفة (Unicode Decorative Numbers)
  // static const Map<int, String> decorativeNumbers = {
  //   1: '۝١', 2: '۝٢', 3: '۝٣', 4: '۝٤', 5: '۝٥',
  //   6: '۝٦', 7: '۝٧', 8: '۝٨', 9: '۝٩', 10: '۝١٠',
  //   11: '۝١١', 12: '۝١٢', 13: '۝١٣', 14: '۝١٤', 15: '۝١٥',
  //   16: '۝١٦', 17: '۝١٧', 18: '۝١٨', 19: '۝١٩', 20: '۝٢٠',
  //   21: '۝٢١', 22: '۝٢٢', 23: '۝٢٣', 24: '۝٢٤', 25: '۝٢٥',
  //   26: '۝٢٦', 27: '۝٢٧', 28: '۝٢٨', 29: '۝٢٩', 30: '۝٣٠',
  //   // يمكن إضافة المزيد حسب الحاجة...
  // };

  // خريطة للأرقام الهندية العادية
  static const Map<String, String> arabicNumerals = {
    '0': '٠',
    '1': '١',
    '2': '٢',
    '3': '٣',
    '4': '٤',
    '5': '٥',
    '6': '٦',
    '7': '٧',
    '8': '٨',
    '9': '٩',
  };

  // تحويل رقم الآية إلى رقم مزخرف
  static String getDecorativeVerseNumber(int verseNumber) {
    // // إذا كان الرقم موجود في الخريطة المزخرفة، استخدمه
    // if (decorativeNumbers.containsKey(verseNumber)) {
    //   return decorativeNumbers[verseNumber]!;
    // }

    // وإلا حوّل إلى أرقام هندية مع الرمز المزخرف
    String arabicNumber = convertToArabicNumerals(verseNumber.toString());
    return '$arabicNumber';
  }

  // تحويل الأرقام الإنجليزية إلى هندية
  static String convertToArabicNumerals(String number) {
    String result = number;
    arabicNumerals.forEach((english, arabic) {
      result = result.replaceAll(english, arabic);
    });
    return result;
  }

  // // الحصول على رقم الآية بتنسيق المصحف مع الدائرة
  // static String getCircledVerseNumber(int verseNumber) {
  //   // رموز Unicode للأرقام المحاطة بدائرة
  //   const Map<int, String> circledNumbers = {
  //     1: '①',
  //     2: '②',
  //     3: '③',
  //     4: '④',
  //     5: '⑤',
  //     6: '⑥',
  //     7: '⑦',
  //     8: '⑧',
  //     9: '⑨',
  //     10: '⑩',
  //     11: '⑪',
  //     12: '⑫',
  //     13: '⑬',
  //     14: '⑭',
  //     15: '⑮',
  //     16: '⑯',
  //     17: '⑰',
  //     18: '⑱',
  //     19: '⑲',
  //     20: '⑳',
  //   };

  //   // إذا كان الرقم أقل من أو يساوي 20، استخدم الرمز المحاط بدائرة
  //   if (circledNumbers.containsKey(verseNumber)) {
  //     return circledNumbers[verseNumber]!;
  //   }

  //   // للأرقام الأكبر، استخدم الأرقام الهندية
  //   return convertToArabicNumerals(verseNumber.toString());
  // }
}
