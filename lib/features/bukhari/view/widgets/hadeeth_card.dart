
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jalees/features/bukhari/model/hadeeth_mode.dart';

class HadeethCard extends StatelessWidget {
  const HadeethCard({
    super.key,
    required this.hadith,
  });

  final Hadith hadith;

  @override
  Widget build(BuildContext context) {
    String narrator = '';
    String source = 'صحيح البخاري';
    if (hadith.english is Map && hadith.english['narrator'] != null) {
      narrator = hadith.english['narrator'];
    }
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              hadith.arabic,
              textDirection: TextDirection.rtl,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 12),
            if (narrator.isNotEmpty)
              Text(
                'الراوي: $narrator',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            const SizedBox(height: 8),
            Text(
              'المصدر: $source',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    final text = hadith.arabic +
                        (hadith.english is Map && hadith.english['text'] != null
                            ? '\n' + hadith.english['text']
                            : '');
                    Clipboard.setData(ClipboardData(text: text));
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('تم النسخ')),
                    );
                  },
                  icon: const Icon(Icons.copy),
                  label: const Text('نسخ'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    final text = hadith.arabic +
                        (hadith.english is Map && hadith.english['text'] != null
                            ? '\n' + hadith.english['text']
                            : '');
                    // مشاركة النص
                    // يمكنك استخدام حزمة share_plus هنا
                  },
                  icon: const Icon(Icons.share),
                  label: const Text('مشاركة'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
