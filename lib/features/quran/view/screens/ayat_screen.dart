import 'package:flutter/material.dart';
import '../../model/quran_model.dart';

class AyatScreen extends StatelessWidget {
  final QuranSurah surah;
  const AyatScreen({super.key, required this.surah});

  @override
  Widget build(BuildContext context) {
    // ملاحظة: يجب إضافة خط مصحفي مثل 'KFGQPC Uthmanic Script HAFS' في pubspec.yaml واستخدامه هنا
    return Scaffold(
      backgroundColor: const Color(0xFFF7F1E1), // بيج فاتح
      appBar: AppBar(
        title: Text(surah.name),
        backgroundColor: const Color(0xFFF7F1E1),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.brown),
        titleTextStyle: const TextStyle(
          color: Colors.brown,
          fontWeight: FontWeight.bold,
          fontSize: 24,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 25,
                  height: 1.5,
                  color: Colors.brown,
                  // fontFamily: 'QuranFont', // فعل هذا بعد إضافة الخط
                ),
                children: [
                  for (final verse in surah.verses) ...[
                    TextSpan(text: verse.text + ' '),
                    WidgetSpan(
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xFFFFE4A0), // ذهبي فاتح
                          border: Border.all(
                            color: Color(0xFFD4AF37),
                            width: 2,
                          ),
                        ),
                        child: Text(
                          '${verse.id}',
                          style: const TextStyle(
                            color: Color(0xFFD4AF37),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    const TextSpan(text: '  '),
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
