import 'package:flutter/material.dart';
import '../../model/quran_model.dart';

class AyatScreen extends StatelessWidget {
  final QuranSurah surah;
  const AyatScreen({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F1E1), // بيج فاتح
      appBar: AppBar(
        title: Text(
          surah.name,
          style: const TextStyle(
            color: Color(0xFF8B6F43), // بني/ذهبي غامق
            fontWeight: FontWeight.bold,
            fontSize: 24,
            fontFamily: 'UthmanicHafs', // خط عثماني رسمي
          ),
        ),
        backgroundColor: const Color(0xFFF7F1E1),
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF8B6F43)),
        // ...existing code...
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: RichText(
              textAlign: TextAlign.justify, // ضبط النص مثل المصحف
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 32, // حجم كبير وواضح
                  height: 1.7, // ارتفاع سطر أنيق
                  color: Color(0xFF8B6F43), // بني/ذهبي غامق
                  fontFamily: 'UthmanicHafs', // الخط العثماني الرسمي
                ),
                children: [
                  for (final verse in surah.verses) ...[
                    TextSpan(text: verse.text),
                    // دائرة رقم الآية بتصميم أقرب للمصحف
                    WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: const Color(0xFFFFF8DC), // ذهبي فاتح جدًا
                          border: Border.all(
                            color: const Color(0xFFBFA046), // ذهبي هادئ
                            width: 2.2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.brown.withOpacity(0.13),
                              blurRadius: 5,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              '${verse.id}',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Color(0xFFB28B00), // رقم ذهبي
                                // fontWeight: FontWeight.bold,
                                fontFamily: 'UthmanicHafs', // خط عثماني Hafs
                                // letterSpacing: ,
                                shadows: [
                                  Shadow(
                                    color: Color(0xFFBFA046),
                                    blurRadius: 2,
                                    offset: Offset(0, 1),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // لا يوجد مسافة بعد رقم الآية
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
