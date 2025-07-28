
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jalees/features/bukhari/model/hadeeth_mode.dart';

class HadeethListCard extends StatelessWidget {
  const HadeethListCard({
    super.key,
    required this.hadiths,
  });

  final List<Hadith> hadiths;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: hadiths.length,
        itemBuilder: (context, index) {
          final hadith = hadiths[index];
          String narrator = '';
          String source = 'صحيح البخاري';
          if (hadith.english is Map &&
              hadith.english['narrator'] != null) {
            narrator = hadith.english['narrator'];
          }
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 10),
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    hadith.arabic,
                    textDirection: TextDirection.rtl,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                  if (narrator.isNotEmpty)
                    Text(
                      'الراوي: $narrator',
                      style: const TextStyle(fontSize: 14),
                    ),
                  const SizedBox(height: 8),
                  Text(
                    'المصدر: $source',
                    style: const TextStyle(fontSize: 13),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {
                          final text =
                              hadith.arabic +
                              (hadith.english is Map &&
                                      hadith.english['text'] != null
                                  ? '\n' + hadith.english['text']
                                  : '');
                          Clipboard.setData(ClipboardData(text: text));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('تم النسخ')),
                          );
                        },
                        icon: const Icon(Icons.copy),
                        label: const Text('نسخ',style: TextStyle(color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 225, 225, 225),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          final text =
                              hadith.arabic +
                              (hadith.english is Map &&
                                      hadith.english['text'] != null
                                  ? '\n' + hadith.english['text']
                                  : '');
                          // مشاركة النص
                          // يمكنك استخدام حزمة share_plus هنا
                        },
                        icon: const Icon(Icons.share),
                        label: const Text('مشاركة',style: TextStyle(color: Colors.black),),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color.fromARGB(255, 225, 225, 225),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      );
  }
}
